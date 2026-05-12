extends State

@export var chez: CharacterBody2D
@export var air_movement_speed = 200.0


func update(_delta: float) -> void:
	# Handle transition to IdleState
	if chez.is_on_floor():
		transition.emit("IdleState")
