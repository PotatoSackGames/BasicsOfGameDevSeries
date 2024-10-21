extends State

func enter_state() -> void:
	_actor.play_animation("Idle")
# Don't need exit_state, as nothing happens with a timer or anything like that here

func process(input: Dictionary, delta: float) -> void:
	_actor.velocity.x = 0.0
	_actor.velocity.y += _actor.gravity * _actor.gravity_direction * delta

	# Can do this safer if you want
	if input.direction != Vector2.ZERO:
		pass
