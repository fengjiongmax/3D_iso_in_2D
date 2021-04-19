extends StateBase

func _command(_msg:Dictionary={}) -> void:
	if _msg.keys().has("direction"):
		var command = _msg["direction"]
		match command:
			Vector3.FORWARD,Vector3.BACK,Vector3.LEFT,Vector3.RIGHT:
				pass
			_:
				return
		var _move_target_coordinate = movable.game_pos + command
		if Grid.coordinate_within_rangev(_move_target_coordinate) &&\
		 Grid.get_game_axisv(_move_target_coordinate) == null:
			_state_machine.switch_state("move",{"direction":command})
		elif movable.is_direction_jumpable(command):
			_state_machine.switch_state("jump",{"direction":command})
		else:
			print("%s not able to move" % _move_target_coordinate)
	elif _msg.keys().has("reach_target"):
		if Grid.coordinate_within_rangev(movable.game_pos + Vector3.DOWN) &&\
		 Grid.get_game_axisv(movable.game_pos + Vector3.DOWN) == null:
			_state_machine.switch_state("fall",{})
			pass
		pass

