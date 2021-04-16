class_name BlockBase
extends Sprite

var game_pos:Vector3 = Vector3.INF

func _ready():
#	print(game_pos)
	pass

func initial_game_pos(x:int,y:int,z:int) -> void:
	set_game_pos(x,y,z)
	engine_fit_game_pos()

func initial_game_posv(new_game_pos:Vector3) -> void:
	initial_game_pos(int(new_game_pos.x),int(new_game_pos.y),int(new_game_pos.z))

func engine_fit_game_pos():
	var engine_pos = GridUtils.game_to_enginev(game_pos)
	self.position = Vector2(engine_pos.x,engine_pos.y)
	self.z_index = engine_pos.z
	pass

func set_game_pos(x:int,y:int,z:int) -> void:
	if game_pos != Vector3.INF:
		Grid.set_axis_objv(null,game_pos)
	Grid.set_axis_obj(self, x, y, z)
	game_pos = Vector3(x,y,z)

func set_game_posv(new_game_pos:Vector3) ->void:
	set_game_pos(int(new_game_pos.x),int(new_game_pos.y),int(new_game_pos.z))

