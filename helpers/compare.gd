class_name Compare

# this is key "S" direction
# Vector3.FORWARD = Vector3( 0, 0, -1 )
static func forward_compare(item1:BlockBase,item2:BlockBase):
	if item1.game_pos.z > item2.game_pos.z:
		return false
	elif item1.game_pos.z < item2.game_pos.z:
		return true
	else:
		return y_compare(item1,item2)

# this is key "Z" direction
# Vector3.BACK = Vector3( 0, 0, 1 )
static func back_compare(item1:BlockBase,item2:BlockBase):
	if item1.game_pos.z > item2.game_pos.z:
		return true
	elif item1.game_pos.z < item2.game_pos.z:
		return false
	else:
		return y_compare(item1,item2)

# this is key "X" direction
# Vector3.RIGHT = Vector3( 1, 0, 0 )
static func right_compare(item1:BlockBase,item2:BlockBase):
	if item1.game_pos.x > item2.game_pos.x:
		return true
	elif item1.game_pos.x < item2.game_pos.x:
		return false
	else:
		return y_compare(item1,item2)

# this is key "A" direction
# Vector3.LEFT = Vector3( -1, 0, 0 )
static func left_compare(item1:BlockBase,item2:BlockBase):
	if item1.game_pos.x > item2.game_pos.x:
		return false
	elif item1.game_pos.x < item2.game_pos.x:
		return true
	else:
		return y_compare(item1,item2)

static func y_compare(item1:BlockBase,item2:BlockBase):
	if item1.game_pos.y > item2.game_pos.y:
		return false
	elif item1.game_pos.y < item2.game_pos.y:
		return true
	else:
		# compare by z-index : z-index = x+y+z
		if GridUtils.calc_xyz(item1.game_pos) > GridUtils.calc_xyz(item2.game_pos):
			return true
		else:
			return false

