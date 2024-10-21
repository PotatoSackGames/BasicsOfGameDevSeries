# BasicsOfGameDevSeries

Creating games can be difficult, but there are lots of ways to make them easier. One way is through the use of design patterns. A design pattern is just a known way to provide certain functionality to a given program (application or game or any kind of program!).

This series will use Godot as its basis; however, I will include Unity, Unreal, and potentially GameMaker tutorials within this series as well over time, and that will include projects with basic implementations.

In our case, we're going to be looking at a series of patterns used for game creation.

## State Machines (also called Finite State Machines)

State machines are a pattern designed actually for code and logic separation, so you can keep logic for different "states" in different classes so that no one state can interfere with any other state. Make sense? The basic format is this (anything in quotes can be named however you wish, so long as you know what it is meant to be/what its function is):
	
	1. State class - the main class you end up inheriting to build new states
		a. has "enter" function
		b. has "exit" function
		c. has "process" function that takes in the delta float, and sometimes an input vector (personal preference, more on this later)
	2. StateMachine class - the main class which handles changing between states and running individual ones
		a. has "change_state" function
		b. often has a list of the states
		c. sometimes associates the states with their names in some fashion
		d. sometimes has functions "add_state" and/or "remove_state" that can add/remove new/old states as the game progresses - think a RPG where a weapon being equipped may give you a new, unique power in the menu: you have to be able to add or remove that power at runtime based on whether or not that weapon is equipped, and to whomever it may be equipped
	

# Where and Why?

You would use a state machine typically if you need to have complex logic to control a character, playable or not. However, there are times where you might want one for buttons or textures in your user-interface, for instance, where a button needs to fully change textures in different circumstances. This is applicable more to non-Godot engines, since Godot handles state changes more easily (it handles it with a sort of internal state machine!).

If you have a lot of if-statements or other types of logical statements in an attempt to separate what happens when you're, for instance, in a jump while shooting, or idling, or so on, then you may want to reach for a state machine to handle it.

# Project

The 1-state_machines folder in this project contains my standard implementation for Godot, with notes about why certain decisions were made. Go check it out! The rest of this particular article is distributed there.
