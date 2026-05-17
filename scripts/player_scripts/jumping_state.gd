extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@export var chez: CharacterBody2D
@export var air_movement_speed = 200.0

func enter() -> void:
	# Start jumping animation
	animation_player.play("jump")
	%Jump.play()


func update(_delta: float) -> void:
		# Handle transition to FallingState
	if chez.velocity.y > 0:
		transition.emit("FallingState")
