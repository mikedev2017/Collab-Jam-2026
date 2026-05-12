extends State

@onready var chez: CharacterBody2D = $"../.."

@export var air_movement_speed = 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# Handle movement in air
	if chez.direction:
		chez.velocity.x = chez.direction * air_movement_speed
	else:
		chez.velocity.x = move_toward(chez.velocity.x, 0, air_movement_speed)
	# Handle transition to Idle State
	if chez.is_on_floor():
		transition.emit("IdleState")
