extends StateBase

var move_direction:Vector3
var engine_direction:Vector2 = GridUtils.game_direction_to_engine(Vector3.DOWN)

var target_game_pos:Vector3
var target_z:int
var target_engine_pos:Vector2

func _enter(_msg:={}) -> void:
	if _msg.keys().has("direction"):
		move_direction = _msg["direction"]
	
	set_next_target()

func _update(_delta:float) -> void:
	var _after_move = movable.position + engine_direction * _delta * movable.MOVESPEED
	var _reach_target = Math.is_betweenv(movable.position,_after_move,target_engine_pos)
	
	if !_reach_target:
		movable.position = _after_move
	else:
		movable.position = target_engine_pos
		movable.reach_target()

func _command(_msg:Dictionary={}) -> void:
	if !_msg.keys().has("reach_target"):
		return
		
	movable.engine_fit_game_pos()
	var _self_down_axie = movable.game_pos + Vector3.DOWN
	var _down_moved = Grid.get_game_axisv(_self_down_axie + move_direction)
	if _down_moved is Movable && _down_moved.get_node("state_machine").state.name == "move":
		if move_direction == Vector3.ZERO:
			_state_machine.switch_state("idle",{})
			return
		else:
			_state_machine.switch_state("move",{"direction":move_direction})
			return
	set_next_target()

func set_next_target():
	target_game_pos = movable.game_pos + Vector3.DOWN
	var _target_game_pos_obj = Grid.get_game_axisv(target_game_pos)
	
	if Grid.coordinate_within_rangev(target_game_pos) && _target_game_pos_obj == null:
		var _target_v3 = GridUtils.game_to_enginev(target_game_pos)
		target_engine_pos = Vector2(_target_v3.x,_target_v3.y)
		target_z = _target_v3.z
		movable.set_game_posv(target_game_pos)
	else:
		if Grid.get_game_axisv(movable.game_pos + move_direction) == null:
			_state_machine.switch_state("move",{"direction":move_direction})
		elif movable.is_direction_jumpable(move_direction):
			_state_machine.switch_state("jump",{"direction":move_direction})
		else:
			_state_machine.switch_state("idle")

