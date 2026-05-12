extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@export var chez: CharacterBody2D

func enter() -> void:
	# Start running animation
	animation_player.play("run")


func update(_delta: float) -> void:
	# Handle transition to FallingState
	if chez.velocity.y > 0:
		transition.emit("FallingState")
	# Handle transition to JumpingState
	if chez.velocity.y < 0:
		transition.emit("JumpingState")
	# Handle transition to IdleState
	if chez.velocity.x == 0 and chez.is_on_floor():
		transition.emit("IdleState")
