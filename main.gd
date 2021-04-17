extends Node2D

const movable = preload("res://blocks/movable/movable.tscn")
const unmovable = preload("res://blocks/unmovable/unmovable.tscn")

onready var grid_texture = load("res://floor_tile/grid.png")

func _ready():
	set_process_input(true)
	# or you can set tiles in 2D tab.
	for x in range(Grid.game_size.x):
		for z in range(Grid.game_size.z):
			$floor_tile.set_cell(x,z,0)
		pass
	# you can add blocks however you want ,but might got something weird.
#	new_movable(0,1,0)
	new_movable(0,0,0)
	new_unmovable(0,0,2)
	new_unmovable(1,0,0)
#	new_unmovable(3,0,3)
	pass

func _input(event):
	if event.is_action_pressed("movable_forward"):
		send_command(Vector3.FORWARD)
	elif event.is_action_pressed("movable_back"):
		send_command(Vector3.BACK)
	elif event.is_action_pressed("movable_left"):
		send_command(Vector3.LEFT)
	elif event.is_action_pressed("movable_right"):
		send_command(Vector3.RIGHT)

func send_command(command:Vector3) -> void:
	for _m in get_tree().get_nodes_in_group("movable"):
		_m.receive_command({"direction":command})
	set_physics_process(true)

func _physics_process(delta):
	for _m in get_tree().get_nodes_in_group("movable"):
		_m._update(delta)
		pass
	pass

func new_movable(x,y,z):
	var _m = movable.instance()
	$movable.add_child(_m)
	_m.initial_game_pos(x,y,z)
	pass

func new_unmovable(x,y,z):
	var _u = unmovable.instance()
	$unmovable.add_child(_u)
	_u.initial_game_pos(x,y,z)
	pass
