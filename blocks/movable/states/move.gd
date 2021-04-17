extends StateBase

var direction: Vector3
var engine_direction:Vector2

var target_game_pos:Vector3
var target_z:int
var target_engine_pos:Vector2

func _enter(_msg:Dictionary={}) -> void:
	if !_msg.keys().has("direction"):
		return
	
	direction = _msg["direction"]
	engine_direction = GridUtils.game_direction_to_engine(direction)

	set_next_target()

func _update(_delta:float) -> void:
	var _after_move = movable.position + engine_direction * _delta * movable.MOVESPEED
	var _reach_target = Math.is_betweenv(movable.position,_after_move,target_engine_pos)
	
	if !_reach_target:
		movable.position = _after_move
	else:
		movable.position = target_engine_pos
		movable.z_index = target_z
		if Grid.get_game_axisv(movable.game_pos + Vector3.DOWN) == null:
			_state_machine.switch_state("fall",{"direction":direction})
		else:
			set_next_target()

func set_next_target():
	target_game_pos = movable.game_pos + direction
	var _target_game_pos_obj = Grid.get_game_axisv(target_game_pos)
	
	if Grid.coordinate_within_rangev(target_game_pos) && _target_game_pos_obj == null:
		var _target_v3 = GridUtils.game_to_enginev(target_game_pos)
		target_engine_pos = Vector2(_target_v3.x,_target_v3.y)
		target_z = _target_v3.z
		movable.set_game_posv(target_game_pos)
		if direction == Vector3.FORWARD || direction == Vector3.LEFT:
			movable.z_index = target_z + 1
		else:
			movable.z_index = target_z - 1
	else:
		if movable.is_direction_jumpable(direction):
			_state_machine.switch_state("jump",{"direction":direction})
		else:
			_state_machine.switch_state("idle")
		pass

