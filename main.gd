extends Node2D

const movable = preload("res://blocks/movable/movable.tscn")
const unmovable = preload("res://blocks/unmovable/unmovable.tscn")

onready var grid_texture = load("res://floor_tile/grid.png")

func _ready():
	# or you can set tiles in 2D tab.
	for x in range(6):
		for z in range(6):
			$floor_tile.set_cell(x,z,0)
		pass
	# you can add blocks however you want ,but might got something weird.
	new_movable(0,1,0)
	new_movable(0,0,0)
	new_unmovable(3,0,3)
	pass

func new_movable(x,y,z):
	var _m = movable.instance()
	$movable.add_child(_m)
	_m.set_game_pos(x,y,z)
	pass

func new_unmovable(x,y,z):
	var _u = unmovable.instance()
	$unmovable.add_child(_u)
	_u.set_game_pos(x,y,z)
	pass
