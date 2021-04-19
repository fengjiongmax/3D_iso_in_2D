class_name Movable
extends BlockBase

const MOVESPEED = 2

signal block_reach_target

func _ready():
	add_to_group("movable")
	pass

func receive_command(msg:Dictionary={}) -> void:
	$state_machine.receive_command(msg)

func _update(delta:float) -> void:
	$state_machine._update(delta)

func is_direction_jumpable(direction:Vector3) -> bool:
	if direction in [Vector3.UP,Vector3.DOWN]:
		return false
	
	var _self_up_coordinate = game_pos + Vector3.UP
	if !Grid.coordinate_within_rangev(_self_up_coordinate):
		return false
	var _self_up_item = Grid.get_game_axisv(_self_up_coordinate)
	if _self_up_item != null:
		return false
	
	var _direction_up_axie = game_pos + direction + Vector3.UP
	if !Grid.coordinate_within_rangev(_direction_up_axie):
		return false
	
	var _direction_up_item = Grid.get_game_axisv(_direction_up_axie)
	if _direction_up_item != null:
		return false
	
	return true

func reach_target():
	emit_signal("block_reach_target")
