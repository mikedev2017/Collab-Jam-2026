class_name State extends Node

# This is a template for States used in a State Machine

signal transition(new_state_name : String)


func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass
