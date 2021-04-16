class_name StateBase
extends Node

onready var _state_machine := get_parent()
var movable:Movable

# then we can minipulate our movable in our states
func _ready():
	movable = owner as Movable
	pass

# we receive commands from our main scene
# in our senario, we will not handle use input in our states
func _command(_msg:Dictionary={}) -> void:
	pass

func _update(_delta:float) -> void:
	pass

# when entering the states,we run this function
func _enter(_msg:={}) -> void:
	pass

# run this when states exit
func _exit() -> void:
	pass
