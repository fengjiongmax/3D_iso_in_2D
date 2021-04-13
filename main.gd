extends Node2D

const movable = "res://blocks/movable/movable.tscn"
const unmovable = "res://blocks/unmovable/unmovable.tscn"

onready var grid_texture = load("res://floor_tile/grid.png")

func _ready():
	# or you can set tiles in 2D tab.
	for x in range(6):
		for z in range(6):
			$floor_tile.set_cell(x,z,0)
		pass
	
	new_movable(0,0,0)
	new_movable(0,0,1)
	new_movable(1,0,0)
	new_movable(1,0,1)
	new_unmovable(3,0,3)
	pass

func new_movable(x,y,z):
	var _m = load(movable).instance()
	$movable.add_child(_m)
	var _engine_pos = Grid.game_to_engine(x,y,z)
	_m.position = _engine_pos
	pass

func new_unmovable(x,y,z):
	var _u = load(unmovable).instance()
	$unmovable.add_child(_u)
	var _engine_pos = Grid.game_to_engine(x,y,z)
	_u.position = _engine_pos
	pass
