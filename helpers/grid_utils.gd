class_name GridUtils

const TEXTURE_SCALE = 3

const texture_w := 24
const texture_h := 25

const SINGLE_X = Vector2(texture_w/2,texture_h/4) * TEXTURE_SCALE
const SINGLE_Z = Vector2(-texture_w/2,texture_h/4) * TEXTURE_SCALE
const SINGLE_Y = Vector2(0,-texture_h/2) * TEXTURE_SCALE

static func game_to_engine(x:int,y:int,z:int) -> Vector3:
	var _rtn_2d = Vector2.ZERO
	_rtn_2d += x*SINGLE_X
	_rtn_2d += z*SINGLE_Z
	_rtn_2d += y*SINGLE_Y
	var _z = (x+y+z)*2
	return Vector3(_rtn_2d.x,_rtn_2d.y,_z)

static func game_to_enginev(game_pos:Vector3) -> Vector3:
	return game_to_engine(int(game_pos.x),int(game_pos.y),int(game_pos.z))

static func calc_xyz(v3:Vector3) -> int:
	return int(v3.x+v3.y+v3.z)

static func game_direction_to_engine(direction:Vector3) -> Vector2:
	match direction:
		Vector3.FORWARD:
			return -SINGLE_Z
		Vector3.BACK:
			return SINGLE_Z
		Vector3.LEFT:
			return -SINGLE_X
		Vector3.RIGHT:
			return SINGLE_X
		Vector3.UP:
			return SINGLE_Y
		Vector3.DOWN:
			return -SINGLE_Y
	return Vector2.ZERO

