extends State


func enter() -> void:
	# Start Idle animation
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	# If velocity.x > 0, then enter RunningState
	# If velocity.y < 0, then enter JumpingState
	pass
