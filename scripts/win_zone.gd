extends Area2D

@export var collision_shape_2d: CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		SceneLoader.load_scene("res://scenes/cutscenes/outro_cutscene.tscn")
