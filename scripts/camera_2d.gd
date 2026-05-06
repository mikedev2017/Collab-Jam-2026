extends Camera2D

var SPEED = 25.0
var direction: int = 1
#var target_pos: Vector2 = Vector2(500, position.y)


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	position.x += SPEED * delta
	#position = lerp(position, target_pos , (SPEED * delta))
