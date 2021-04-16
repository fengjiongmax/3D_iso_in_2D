class_name Math

# start < target < end
static func is_between(start:float,end:float,target:float) -> bool:
	var _start = round(start * 10)/10
	var _end = round(end * 10)/10
	var _target = round(target * 10)/10
	
	var _tmp 
	if _start >= _end:
		_tmp = _start
		_start = _end
		_end = _tmp
	
	if _start <= _target && target <= _end:
		if _end - _start >= _end - _target:
			return true
	
	return false

static func is_betweenv(start:Vector2,end:Vector2,target:Vector2) -> bool:
	return is_between(start.x,end.x,target.x) &&\
	 is_between(start.y,end.y,target.y)
