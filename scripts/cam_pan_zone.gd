extends Area2D

@export var collision_shape_2d: CollisionShape2D
@export var camera: Camera2D

var hasPannedCamera: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not hasPannedCamera:
		camera.trigger_camera_pan()
		hasPannedCamera = true
