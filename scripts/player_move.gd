# Player.gd
extends CharacterBody2D

@onready var velocity_component = $VelocityComponent # Accessing child node
@onready var animation_component = $AnimationComponent # Accessing child node
@onready var anim_tree = $"AnimationTree"

func _physics_process(delta):
	anim_tree.active = true
	# Component logic
	velocity_component.apply_gravity(delta)
	if is_on_floor():
		velocity_component.handle_jump()
	velocity_component.handle_movement()
	
	# Godot 4 uses internal 'velocity' variable for move_and_slide
	velocity = velocity_component.velocity
	
	# Get animation state
	# Determine which state we should be in
	#animation_component.update_state()
	# play the animation for that state
	#animation_component.play_animation()
	
	move_and_slide()
	
	# Update component's local copy of velocity after collision
	velocity_component.velocity = velocity

#func add_to_inventory(data: ItemData):
	# We pass the data to our Autoload (Singleton)
	#InventorySystem.add_item(data)
	
	# Optional: Trigger a visual effect or sound
	#print("Player received: " + str(data.name))
