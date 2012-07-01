# ###################################################
# Copyright (C) 2012 The Unknown Horizons Team
# team@unknown-horizons.org
# This file is part of Unknown Horizons.
#
# Unknown Horizons is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
# Free Software Foundation, Inc.,
# 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
# ###################################################
from collections import defaultdict
from horizons.ai.aiplayer.unitmanager import UnitManager
from horizons.command.diplomacy import AddEnemyPair
from horizons.command.unit import Attack

import logging
from horizons.util.python.callback import Callback
from horizons.util.shapes.circle import Circle
from horizons.world.units.movingobject import MoveNotPossible


class BehaviorAction(object):
	"""
	This is an abstract BehaviorAction component.
	"""
	log = logging.getLogger('ai.aiplayer.behavioraction')
	default_certainty = 1.0

	def __init__(self, owner):
		self.owner = owner
		self.world = owner.world
		self.session = owner.session
		# Witchery below is a way to have certainty() always return the same certainty if it's not defined per behavior.
		self._certainty = defaultdict(lambda: (lambda **env: self.default_certainty))

	def certainty(self, action_name, **environment):
		return self._certainty[action_name](**environment)

# Action components below are divided into Idle, Offensive and Defensive actions.
# This is just an arbitrary way to do this. Another good division may consist of "Aggressive, Normal,Cautious"
# (division below is not related to the way dictionaries in BehaviorManager are named (offensive, idle, defensive))

# Defensive Actions
#	Actions used in response to being attacked.
#	Possible usage may be: sailing back to main settlement, fleeing battle, sending reinforcements

# Idle Actions
#	Actions used in situations when there are no ships nearby.
#	Possible usage may be: scouting, sailing randomly, sailing back to main settlement

class BehaviorActionPirateRoutine(BehaviorAction):
	"""
	Idle behavior for Pirate player. It has to be specialized for Pirate since general AI does not have home_point.
	Responsible for pirate ships routine when no one is around. States change in a loop:
	idle -> moving_random -> going_home -> idle
	"""

	def __init__(self, owner):
		super(BehaviorActionPirateRoutine, self).__init__(owner)

	def _arrived_home(self, ship):
		self.owner.ships[ship] = self.owner.shipStates.idle

	def _sail_home(self, ship):
		try:
			ship.move(Circle(self.owner.home_point, self.owner.home_radius), Callback(self._arrived_home, ship))
			self.owner.ships[ship] = self.owner.shipStates.going_home
		except MoveNotPossible:
			self.owner.ships[ship] = self.owner.shipStates.idle
			self.log.debug('Pirate %s: Ship %s: unable to move home at %s' % (self.owner.worldid, ship, self.owner.home_point))

	def no_one_in_sight(self, **environment):
		"""
		Idle action, sail randomly when no ship was spotted nearby.
		"""
		ship_group = environment['ship_group']
		for ship in ship_group:
			if self.owner.ships[ship] == self.owner.shipStates.idle:
				point = self.session.world.get_random_possible_ship_position()
				try:
					ship.move(point, Callback(self._sail_home, ship))
					self.owner.ships[ship] = self.owner.shipStates.moving_random
				except MoveNotPossible:
					self.log.debug('Pirate %s: Ship %s: unable to move random at %s' % (self.owner.worldid, ship, point))
		BehaviorAction.log.info('no_one_in_sight action')


class BehaviorActionKeepFleetTogether(BehaviorAction):

	dispersion_threshold = 20.0 # TODO: move to YAML/Personality

	def __init__(self, owner):
		super(BehaviorActionKeepFleetTogether, self).__init__(owner)

		# TODO: consider ditching certainty for this one, or at least dispersion calculations
		def certainty_no_one_in_sight(**env):
			ship_group = env['ship_group']
			if len(ship_group) > 1:
				dispersion = UnitManager.calculate_ship_dispersion(ship_group)
				if dispersion <= self.dispersion_threshold:
					return BehaviorAction.default_certainty
			return 0.0
		self._certainty['no_one_in_sight'] = certainty_no_one_in_sight

	def no_one_in_sight(self, **environment):
		"""
		When no enemies are in sight, and the groups is dispersed, bring the whole fleet together.
		"""

		ship_group = environment['ship_group']
		# TODO: find a good way to bring ships together, (mainly solve issue when weight center is inaccessible)


class BehaviorActionKeepFleetDispersed(BehaviorAction):
	"""
	Will aim to keep fleet dispersion non further than dispersion_epsilon.
	"""
	dispersion_threshold = 15.0

	def __init__(self, owner):
		super(BehaviorActionKeepFleetDispersed, self).__init__(owner)

		def certainty_no_one_in_sight(**env):
			ship_group = env['ship_group']
			if len(ship_group) > 1:
				dispersion = UnitManager.calculate_ship_dispersion(ship_group)
				if dispersion <= self.dispersion_threshold:
					return BehaviorAction.default_certainty
			return 0.0
		self._certainty['no_one_in_sight'] = certainty_no_one_in_sight

	def no_one_in_sight(self, **environment):
		"""
		When no enemies are in sight, disperse ship fleet (unless it already is)
		"""
		pass  # TODO: implement

# Offensive Actions
#	Actions used when there is a possibility to engage in combat with other players.
#	It is also reasonable to flee from enemies if they are much stronger.

# Common certainty functions for offensive actions
def certainty_power_balance_exp(**environment):
	"""
	Return power_balance^2, altering the exponent will impact the weight certainty has.
	"""
	return BehaviorAction.default_certainty * (environment['power_balance'] ** 2)

def certainty_power_balance_inverse(**environment):
	"""
	Return power_balance reciprocal,
	"""

	return BehaviorAction.default_certainty * (1./environment['power_balance'])

class BehaviorActionRegular(BehaviorAction):
	"""
	A well-balanced way to respond to situations in game.
	"""

	def __init__(self, owner):
		super(BehaviorActionRegular, self).__init__(owner)
		self._certainty['pirates_in_sight'] = certainty_power_balance_exp
		self._certainty['fighting_ships_in_sight'] = certainty_power_balance_exp

	def pirates_in_sight(self, **environment):
		"""
		Attacks pirates only if they are enemies already and the power balance is advantageous.
		"""
		pirates = environment['enemies']
		ship_group = environment['ship_group']
		power_balance = environment['power_balance']

		# It's enough to check if first pirate is hostile, since there is only one pirate player.
		if self.session.world.diplomacy.are_enemies(self.owner, pirates[0].owner):
			# Let each ship attack it's closest enemy to maximize dps (in a way)
			ship_pairs = UnitManager.get_closest_ships_for_each(ship_group, pirates)
			for ship, pirate in ship_pairs:
				Attack(ship, pirate).execute(self.session)
			BehaviorAction.log.info('Attacking pirate player.')
		else:
			BehaviorAction.log.info('Not attacking pirate player.')

	def fighting_ships_in_sight(self, **environment):
		"""
		Attacks frigates only if they are enemies already and the power balance is advantageous.
		"""
		enemies = environment['enemies']
		ship_group = environment['ship_group']
		power_balance = environment['power_balance']

		if self.session.world.diplomacy.are_enemies(self.owner, enemies[0].owner):
			for ship in ship_group:
				Attack(ship, enemies[0]).execute(self.session)
			BehaviorAction.log.info('ActionRegular: Attacked enemy ship')
		else:
			BehaviorAction.log.info('ActionRegular: Enemy ship was not hostile')


class BehaviorActionCoward(BehaviorAction):

	def __init__(self, owner):
		super(BehaviorActionCoward, self).__init__(owner)
		# Certainty here is a hyperbolic function from power_balance
		# (higher power_balance -> lesser chance of doing nothing)
		# TODO: skip cowardice if already in war with pirates (pirates will attack anyway)
		# TODO: figure out why it gives unusually high certainty
		self._certainty['pirates_in_sight'] = certainty_power_balance_inverse

	def pirates_in_sight(self, **environment):
		"""
		Dummy action, do nothing really.
		"""
		#TODO: add "common actions" module or something like that in order to avoid code repetition (add regular attack here)
		BehaviorAction.log.info('Pirates give me chills man.')


class BehaviorActionPirateHater(BehaviorAction):

	def __init__(self, owner):
		super(BehaviorActionPirateHater, self).__init__(owner)
		#self._certainty['pirates_in_sight'] = lambda **env: certainty_power_balance(**env)/2

	def pirates_in_sight(self, **environment):
		"""
		Breaks diplomacy and attacks pirates.
		"""
		enemies = environment['enemies']
		ship_group = environment['ship_group']
		power_balance = environment['power_balance']

		if not self.session.world.diplomacy.are_enemies(self.owner, enemies[0].owner):
				AddEnemyPair(self.owner, enemies[0].owner).execute(self.session)
		BehaviorAction.log.info('I feel urgent need to wipe out them pirates.')