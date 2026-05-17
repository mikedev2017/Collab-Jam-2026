extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("outro")
	%AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip_cutscene"):
		SceneLoader.load_scene("res://scenes/levels/level_1.tscn")
	
	if !animation_player.is_playing():
		SceneLoader.load_scene("res://scenes/levels/level_1.tscn")
