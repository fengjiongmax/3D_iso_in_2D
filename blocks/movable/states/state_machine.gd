class_name StateMachine
extends Node

export var initial_state := NodePath()

onready var state: StateBase = get_node(initial_state) setget set_state
onready var _state_name := state.name

var movable:Movable

func _ready():
	state._enter()
	movable = owner as Movable
	pass

func _update(delta) -> void :
	state._update(delta)

func receive_command(msg:Dictionary) -> void:
	state._command(msg)
	pass

func switch_state(target_state_path:String,msg:Dictionary ={}) -> void:
	if ! has_node(target_state_path):
		return
	
	var target_state := get_node(target_state_path)
	
	state._exit()
	self.state = target_state
	state._enter(msg)
	

func set_state(value: StateBase) -> void:
	state = value
	_state_name = state.name
	pass
