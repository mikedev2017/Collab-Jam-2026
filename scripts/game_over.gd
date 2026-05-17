extends Control

func _ready() -> void:
	%Kill_Sound.play()
	%AnimationPlayer.play("Kill_Chez")

func _on_button_restart_game_pressed() -> void:
	SceneLoader.load_scene("res://scenes/levels/level_1.tscn")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip_cutscene"):
		SceneLoader.load_scene("res://scenes/levels/level_1.tscn")
