extends Node2D

@onready var start_attack: Timer = $StartAttack
@onready var fire_rate_timer: Timer = $FireRateTimer

@export var wait_before_attack : float = 5.0
@export var knife_reload_time : float = 1.0


func _ready() -> void:
	start_attack.wait_time = wait_before_attack
	fire_rate_timer.wait_time = knife_reload_time
	start_attack.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start_attack.time_left > 0:
		print("Count down till knife throwing: " + str(start_attack.time_left))
	else:
		pass


func shoot() -> void:
	var load_bullet = preload("res://scenes/knife_bullet.tscn")
	var new_bullet = load_bullet.instantiate()
	get_tree().get_root().add_child(new_bullet)
	new_bullet.global_position = self.global_position


func _on_start_attack_timeout() -> void:
	fire_rate_timer.start()
	shoot()


func _on_fire_rate_timer_timeout() -> void:
	shoot()
