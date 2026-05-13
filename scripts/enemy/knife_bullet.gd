extends Area2D

@export var damage = 1
@export var speed = 400
@export var traveled_distance = 0
@export var bullet_range = 1000

#var direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add sounds here
	#$BulletSound.set_pitch_scale(randf_range(1.5, 2.0))
	#$BulletSound.play()
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT
	position += direction * speed * delta
	traveled_distance += speed * delta
	
	if traveled_distance > bullet_range:
		queue_free()
		print("Bullet removed")


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	else:
		queue_free()
