class_name State
extends Node

# This is not the only way to make a state. You can do whatever you want with them! It's a very versatile pattern.

# Allow switching states from here. How to do so without having a direct reference? We'll use the node names; this isn't generally "safe" (what if the state doesn't exist?). But it's a standard, and we'll stick with it for now.
var _machine: StateMachine

# The thing which is controlled by the state machine; nice to have in the individual states, set once upon state machine being ready and it having exported the value
var _actor

# Handles playing any repeated animations, for instance, or setting the velocity of the actor, or any one-time-on-new-state features you might have (also think highlighting a button or what have you)
func enter_state() -> void:
	pass

# Handles stopping any timers, for instance, that might be included. Also, if there's an animation between this state and the next, this might be a good place to play it (think an animation where, if you jumped from a high-enough ledge, it shows you squashing more than normal)
func exit_state() -> void:
	pass

# Runs every process or physics process frame (depending on your needs) of the state machine itself. Handles any physics changes, and really any logic which has to happen in process or physics process.
# Note that the input value here is a Dictionary; this is to hold onto any and all buttons pressed if it's a player character, or any specific commands that need to be run if it's an NPC or enemy.
func process(_input: Dictionary, _delta: float) -> void:
	pass
