extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	SceneLoader.load_scene("res://scenes/levels/level_1.tscn")
