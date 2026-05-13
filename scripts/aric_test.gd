extends Node2D

#@onready var camera_2d: Camera2D = $Camera2D
@onready var label_camera_speed: Label = %LabelCameraSpeed
#@onready var label_camera_position: Label = %LabelCameraPosition
@onready var label_kill_chez: Label = %LabelKillChez
@export var player: CharacterBody2D

@export var scrollspeed : float = 1.0


var acceleration_marker : float = 200.00
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(scrollspeed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#camera_2d.position.x = camera_2d.position.x + scrollspeed * delta
	#camera_2d.position.y = (player.position.y + -147) + scrollspeed * delta
	label_camera_speed.text = str("Camera speed: " + str(scrollspeed))
	#label_camera_position.text = str("Camera position: " + str(roundf(camera_2d.position.x)))
	label_kill_chez.text = str("Chez killed: " + str(GameManager.chez_killed))
	# Everytime the camera passes it's acceration marker, then increase camera speed to pressure the Player
	#if camera_2d.position.x > acceleration_marker:
		#print("Accelerated")
		#acceleration_marker += 350
		#accelerate_camera()


#func accelerate_camera():
	#scrollspeed += 20
