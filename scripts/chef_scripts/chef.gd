extends Node

@onready var chez_pc_placeholder: CharacterBody2D = $"../Chez_PC_Placeholder"

var chase_speed: float = 40.0
var acceleration_marker: float = 200
var chase_speed_max: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if self.position.x < chez_pc_placeholder.position.x or self.position.y < chez_pc_placeholder.position.y:
		#print("move closer" + " chef is at " + str(self.position.x))
		self.position.x = move_toward(self.position.x, chez_pc_placeholder.position.x, chase_speed*delta)
		self.position.y = move_toward(self.position.y, chez_pc_placeholder.position.y, chase_speed*delta)
		
		if self.position.x > acceleration_marker:
			print("Accelerated")
			
			acceleration_marker += 350
			if chase_speed < chase_speed_max:
				chase_speed += 20
				print("Chase speed increased to " + str(chase_speed))
			elif chase_speed == chase_speed_max:
				print("Max chase speed reached")
