extends Camera2D

@export var point_b: Marker2D
@export var pan_time: float = 1.5
@export var hold_time: float = 1.0

func trigger_camera_pan():
	# Pause the game so processes stop running, except the camera
	get_tree().paused = true
	
	# Save the current position of the camera for reference to pan back to
	var point_a = global_position
	
	# Tween between the current camera position and the marker position
	var tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS) # Required so tween works while game is paused
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	
	# Pan to Point B
	tween.tween_property(self, "global_position", point_b.global_position, pan_time)
	
	# Hold at Point B for hold time
	tween.tween_interval(hold_time)
	
	# Pan back to Point A
	tween.tween_property(self, "global_position", point_a, pan_time)
	
	# Unpause game to run processes again
	tween.finished.connect(func():
		get_tree().paused = false
	)
