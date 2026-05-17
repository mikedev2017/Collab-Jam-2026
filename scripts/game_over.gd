extends Control

func _ready() -> void:
	%AudioStreamPlayer2D.play()
	%AnimationPlayer.play("Kill_Chez")

func _on_button_restart_game_pressed() -> void:
	SceneLoader.load_scene("res://scenes/levels/level_1.tscn")
