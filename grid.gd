# Godot Global/Autoload : Grid
extends Node

const TEXTURE_SCALE = 3

onready var block_texture = load("res://blocks/movable/movable.png")

onready var texture_w = block_texture.get_width()
onready var texture_h = block_texture.get_height()

onready var SINGLE_X = Vector2(texture_w/2,texture_h/4) * TEXTURE_SCALE
onready var SINGLE_Z = Vector2(-texture_w/2,texture_h/4) * TEXTURE_SCALE

func _ready():
	pass

func game_to_engine(x:int,y:int,z:int):
	var _rtn = Vector2(0,0)
	_rtn += x*SINGLE_X
	_rtn += z*SINGLE_Z
	return _rtn

func game_to_enginev3(game_position:Vector3):
	game_to_engine(game_position.x,game_position.y,game_position.z)
	pass
