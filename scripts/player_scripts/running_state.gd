extends State

@onready var chez: CharacterBody2D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@export var running_speed = 200.0

func enter() -> void:
	# Start running animation
	print("Running State")
	animation_player.play("run")


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
		# Handle transition to JumpState
	if Input.is_action_pressed("jump") and chez.is_on_floor():
		transition.emit("JumpingState")
	# Handling movement
	if chez.direction:
		chez.velocity.x = chez.direction * running_speed
	else:
		chez.velocity.x = move_toward(chez.velocity.x, 0, running_speed)
	# Handle transition to IdleState
	if chez.velocity == Vector2.ZERO:
		transition.emit("IdleState")
