class_name StateMachine
extends Node

# Easiest way to get access to the associatec character in the child states
@export var Actor: Node

# The default/start state can be handled in many ways, this is just one of them; you could assume the first state in the children is the default automatically, for instance. I prefer exporting it.
@export var DefaultState: State

# Might seem odd to use a dictionary, but it's easier than searching the children each time, or an array, for a state with the given name
var _states = {}

# There are different ways to handle this, and it determines more or less how your state machine functions. You might have sub-states on states, and this could be a push-down automata, meaning it stores an entire stack of states instead of just one.
# However, as this is meant to be a basics series, we'll just do a normal, single state as the currently-active one.
var CurrentState: State

# Here, we initialize all of our states once and only once in order to not have to get the actor multiple times per state or anything like that.
func _ready() -> void:
	assert(null != Actor, "Actor is null in state machine")
	assert(null != DefaultState, "No default state set in state machine")
	# Can also export individual state scenes, or the state nodes themselves, but I prefer just to have them as children.
	for child in get_children():
		child._actor = Actor
		child._machine = self
		
		# This approach can be thought of as "standard" in Godot, but can also be considered "ugly" due to using strings. I have a solution for that below, but it is purely optional.
		_states[child.name] = child
		
	change_state(DefaultState)

# Change to a specific state that is known beforehand
func change_state(state: State) -> void:
	assert(null != state, "Do not set state to null in state machine")
	if null != CurrentState:
		await CurrentState.exit_state() # We await in case there's an animation that needs to occur
	
	CurrentState = state
	await CurrentState.enter_state() # We await here in case the animation is a single-shot animation

# Simple override for strings, but below optional approach may negate the need for this
func change_state_name(state_name: String) -> void:
	change_state(_states[state_name])

# Run the machine! Current state gets processed and others do not, fully separating the logic.
func process(input: Dictionary, delta: float) -> void:
	# Since the default state must be set, the following should never be null at this point, but a check could be safer.
	CurrentState.process(input, delta) # Note we don't await here because this is called from process or physics process. 

#region Optional - benefits can be seen in state machine usage in this game

func _set(property: StringName, value: Variant) -> bool:
	if "CurrentState" == property:
		change_state(value)
		return true
	
	return false

func _get(property: StringName) -> Variant:
	if _states.has(property):
		return _states[property]
	
	return null # Ensure it goes back to the parent get call if the name of it isn't a state

#endregion Optional - benefits can be seen in state machine usage in this agame
