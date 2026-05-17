extends Area2D

@export var collision_shape_2d: CollisionShape2D
@export var camera: Camera2D


func _on_body_entered(body: Node2D) -> void:
	if !GameManager.goal_camera_has_panned:
		if body.is_in_group("player"):
			camera.trigger_camera_pan()
			GameManager.goal_camera_has_panned = true
	else:
		pass
