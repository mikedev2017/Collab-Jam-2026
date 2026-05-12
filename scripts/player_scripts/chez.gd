extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var direction : float

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	direction = Input.get_axis("left", "right")
	if direction < 0:
		animated_sprite_2d.flip_h = true
	if direction > 0:
		animated_sprite_2d.flip_h = false 
	move_and_slide()
	
	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = jump_velocity
	
	# Get the input direction and handle the movement/deceleration.
	#var direction := Input.get_axis("left", "right")
	#if direction:
		#velocity.x = direction * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
#
	
