extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var chez: CharacterBody2D = $"../.."

func enter() -> void:
	# Start Idle animation
	print("Idle state")
	animation_player.play("idle")


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	# Handle transition to FallingState
	if chez.velocity.y > 0:
		transition.emit("FallingState")
	# Handle transition to RunningState
	if chez.direction != 0 and chez.is_on_floor():
		transition.emit("RunningState")
	# Handle transition to JumpingState
	if Input.is_action_pressed("jump") and chez.is_on_floor():
		transition.emit("JumpingState")
