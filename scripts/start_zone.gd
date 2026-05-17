extends Area2D

@export var collision_shape_2d: CollisionShape2D
@export var chef: CharacterBody2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chef.chefCanMove = true
		print("Chef can now move!!!!!!")
