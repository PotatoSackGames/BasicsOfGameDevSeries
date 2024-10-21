extends CharacterBody2D

@onready var _state_machine = %StateMachine
@onready var _sprite = %Sprite
@onready var _collision = %CollisionShape2D

var gravity: float
var gravity_direction: Vector2

func _ready() -> void:
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	gravity_direction =  ProjectSettings.get_setting("physics/2d/default_gravity_vector")
