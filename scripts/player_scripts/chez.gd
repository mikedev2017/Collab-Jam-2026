extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var chez_health = 1
@export var speed = 200.0
@export var jump_velocity = -300.0

var direction : float

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("left", "right")
	if direction != 0:
		if direction < 0:
			animated_sprite_2d.flip_h = true
		if direction > 0:
			animated_sprite_2d.flip_h = false
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
#
	move_and_slide()


func take_damage(incoming_damage):
	chez_health -= incoming_damage
	if chez_health <= 0:
		print("Chez got killed")
