extends Node


var player: PlayerSignals = PlayerSignals.new()


@warning_ignore_start("unused_signal")
class PlayerSignals:
	signal mana_gained(amount: int)
