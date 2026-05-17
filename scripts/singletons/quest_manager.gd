extends Node

var talk_to_toby : bool
var talk_to_nimbus : bool
var talk_to_jerry : bool
var office_door : bool

func _ready() -> void:
	talk_to_toby = false
	talk_to_nimbus = false
	talk_to_jerry = false
	office_door = false


func _process(delta: float) -> void:
	# Unlock Office Door to the Boss Room
	if talk_to_toby and talk_to_nimbus and talk_to_jerry:
		office_door = true
