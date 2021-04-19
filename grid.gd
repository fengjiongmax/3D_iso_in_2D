# Godot Global/Autoload : Grid
extends Node

var game_arr = [] # a 3D array
# let's just assume we'll have a board with the size of V3(8,8,8)
var game_size = Vector3(6,6,6)

func _ready():
	set_grid_array()

func set_grid_array():
	game_arr.clear()
	for x in range(game_size.x):
		game_arr.append([])
		for y in range(game_size.y):
			game_arr[x].append([])
			for _z in range(game_size.z):
				game_arr[x][y].append(null)

func get_game_axis(x,y,z) -> Object:
	if !coordinate_within_range(x,y,z):
		return Object()
	
	return game_arr[x][y][z]

func get_game_axisv(pos:Vector3) -> Object:
	return get_game_axis(pos.x,pos.y,pos.z)

func coordinate_within_range(x:int, y:int, z:int) -> bool:
	if x <0 || y<0 || z<0 || \
	x >= len(game_arr) || y >= len(game_arr[0]) || z >= len(game_arr[0][0]):
		return false
	return true

func coordinate_within_rangev(pos:Vector3) -> bool:
	return coordinate_within_range(int(pos.x),int(pos.y),int(pos.z))

func set_axis_obj(obj:Object, x:int, y:int, z:int) -> void:
	if coordinate_within_range(x,y,z):
		game_arr[x][y][z] = obj

func set_axis_objv(obj:Object,pos:Vector3) -> void:
	set_axis_obj(obj,int(pos.x),int(pos.y),int(pos.z))

func sort_by_direction(direction:Vector3) -> Array:
	var _sorted = []
	
	_sorted = get_tree().get_nodes_in_group("movable").duplicate()
	match direction:
		Vector3.FORWARD:
			_sorted.sort_custom(Compare,"forward_compare")
		Vector3.BACK:
			_sorted.sort_custom(Compare,"back_compare")
		Vector3.LEFT:
			_sorted.sort_custom(Compare,"left_compare")
		Vector3.RIGHT:
			_sorted.sort_custom(Compare,"right_compare")
	
	return _sorted

