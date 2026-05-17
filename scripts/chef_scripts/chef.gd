extends Node

@onready var chez_pc_placeholder: CharacterBody2D = $"../Chez_PC_Placeholder"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D_KillZone/CollisionShape2D

var chase_speed: float = 40.0
var acceleration_marker: float = 200
var chase_speed_max: float = 100
var chefCanMove: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	
	# If player has passed start trigger, allow Chef to move
	if chefCanMove:
		# If Chef is either behind Chez or in front of Chez, move Chef towards position of Chez
		if abs(self.position.x - chez_pc_placeholder.position.x) > 0 or abs(self.position.y - chez_pc_placeholder.position.y) > 0:
			self.position.x = move_toward(self.position.x, chez_pc_placeholder.position.x, chase_speed*delta)
			self.position.y = move_toward(self.position.y, chez_pc_placeholder.position.y, chase_speed*delta)
			
			if self.position.x > chez_pc_placeholder.position.x:
				animated_sprite_2d.flip_h = true
				collision_shape_2d.rotation = deg_to_rad(114)
				
			if self.position.x < chez_pc_placeholder.position.x:
				animated_sprite_2d.flip_h = false
				collision_shape_2d.rotation = deg_to_rad(73.5)
			# Increase Chef's chase speed over time
			if self.position.x > acceleration_marker:
				#print("Accelerated")
				
				acceleration_marker += 350
				if chase_speed < chase_speed_max:
					chase_speed += 20
					#print("Chase speed increased to " + str(chase_speed))
				elif chase_speed == chase_speed_max:
					#print("Max chase speed reached")
					pass
