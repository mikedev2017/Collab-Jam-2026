extends Node

var chez_killed : bool
var goal_camera_pan : bool = true

func _ready() -> void:
	chez_killed = false
	goal_camera_pan = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if chez_killed == true:
		SceneLoader.load_scene("res://scenes/game_over.tscn")
		chez_killed = false
		goal_camera_pan = false
