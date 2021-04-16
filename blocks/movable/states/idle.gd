extends StateBase

func _command(_msg:Dictionary={}) -> void:
	if _msg.keys().has("direction"):
		_state_machine.switch_state("move",{"direction":_msg["direction"]})
		pass
	pass
