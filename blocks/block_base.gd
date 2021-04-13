class_name BlockBase
extends Sprite

var game_pos:Vector3

func _ready():
	pass

func set_game_pos(x:int,y:int,z:int):
	game_pos = Vector3(x,y,z)
	var engine_pos = Grid.game_to_engine(x,y,z)
	self.position = Vector2(engine_pos.x,engine_pos.y)
	self.z_index = engine_pos.z
	pass

func set_game_posv3(new_pos:Vector3):
	set_game_pos(int(new_pos.x),int(new_pos.y),int(new_pos.z))
	pass

