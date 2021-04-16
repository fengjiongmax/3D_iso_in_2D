class_name Movable
extends BlockBase

const MOVESPEED = 2

func _ready():
	add_to_group("movable")
	pass

func receive_command(msg:Dictionary={}) -> void:
	$state_machine.receive_command(msg)

func _update(delta:float) -> void:
	$state_machine._update(delta)
