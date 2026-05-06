extends Node2D

@onready var camera_2d: Camera2D = $Camera2D

@export var scrollspeed : float = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_2d.position.x = camera_2d.position.x + scrollspeed * delta


func _on_area_2d_death_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print(str(body) + " was killed by chef")
