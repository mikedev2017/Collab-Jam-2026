extends State

@onready var step_timer: Timer = %StepTimer
@onready var footstep_audio: AudioStreamPlayer = %Footstep
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@export var chez: CharacterBody2D

const STEP_INTERVAL = 0.1 # Time in seconds between steps

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


func physics_update(_delta: float) -> void:
	if step_timer.is_stopped():
			footstep_audio.play()
			step_timer.start(STEP_INTERVAL)
