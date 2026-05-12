extends Control


func _on_button_restart_game_pressed() -> void:
	SceneLoader.load_scene("res://scenes/test_level.tscn")
