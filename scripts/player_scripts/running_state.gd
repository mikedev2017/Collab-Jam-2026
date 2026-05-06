extends State


func enter() -> void:
	# Start running animation
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	# If velocity == 0, then enter IdleState
	# If velocity.y < 0, then enter JumpingState
	pass
