extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@export var chez: CharacterBody2D

func enter() -> void:
	# Start Idle animation
	animation_player.play("idle")


func exit() -> void:
	pass


func update(delta: float) -> void:
	# Handle transition to FallingState
	if chez.velocity.y > 0:
		transition.emit("FallingState")
	# Handle transition to JumpingState
	if chez.velocity.y < 0:
		transition.emit("JumpingState")
	# Handle transition to RunningState
	if chez.velocity.length() > 0.0 and chez.is_on_floor():
		transition.emit("RunningState")
