extends Node

var chez_killed : bool 

func _ready() -> void:
	chez_killed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chez_killed == true:
		SceneLoader.load_scene("res://scenes/game_over.tscn")
		chez_killed = false
