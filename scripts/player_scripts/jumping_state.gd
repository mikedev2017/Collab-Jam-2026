extends State

@onready var chez: CharacterBody2D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@export var jump_velocity = -300.0
@export var air_movement_speed = 200.0

func enter() -> void:
	# Start jumping animation
	chez.velocity.y = jump_velocity
	animation_player.play("jump")


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	# Handle movement in air
	if chez.direction:
		chez.velocity.x = chez.direction * air_movement_speed
	else:
		chez.velocity.x = move_toward(chez.velocity.x, 0, air_movement_speed)
	# Handle transition to Falling State
	if chez.velocity.y > 0:
		transition.emit("FallingState")
