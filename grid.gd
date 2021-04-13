# Godot Global/Autoload : Grid
extends Node

const TEXTURE_SCALE = 3

onready var block_texture = load("res://blocks/movable/movable.png")

onready var texture_w = block_texture.get_width()
onready var texture_h = block_texture.get_height()

onready var SINGLE_X = Vector2(texture_w/2,texture_h/4) * TEXTURE_SCALE
onready var SINGLE_Z = Vector2(-texture_w/2,texture_h/4) * TEXTURE_SCALE
onready var SINGLE_Y = Vector2(0,-texture_h/2) * TEXTURE_SCALE

func _ready():
	pass

func game_to_engine(x:int,y:int,z:int) -> Vector3:
	var _rtn_2d = Vector2(0,0)
	_rtn_2d += x*SINGLE_X
	_rtn_2d += z*SINGLE_Z
	_rtn_2d += y*SINGLE_Y
	var _z = x+y+z
	return Vector3(_rtn_2d.x,_rtn_2d.y,_z)

func game_to_enginev3(game_position:Vector3):
	return game_to_engine(int(game_position.x),int(game_position.y),int(game_position.z))
