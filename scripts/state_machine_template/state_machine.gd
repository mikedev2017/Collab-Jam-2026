class_name StateMachine extends Node

# This is the Template for a State Machine

@export var current_state: State

var states : Dictionary[String, State] = {}


func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transition.connect(change_state)
		else:
			push_warning("State Machine contains incompatible child node")
	
	await owner.ready
	current_state.enter()


func _process(delta: float) -> void:
	current_state.update(delta)


func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)


func change_state(new_state_name: String) -> void:
	var new_state: State = states.get(new_state_name)
	assert(new_state, "State not found: " + new_state_name)
	
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
	else:
		push_warning("State does not exist")
