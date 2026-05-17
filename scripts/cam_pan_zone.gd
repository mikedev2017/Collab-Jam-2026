extends Area2D

@export var collision_shape_2d: CollisionShape2D
@export var camera: Camera2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GameManager.goal_camera_pan:
		camera.trigger_camera_pan()
