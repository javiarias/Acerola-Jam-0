extends Label



func _process(delta):
	text = str(GameManager.GameTimeStr()) + " - " + GameManager.GetTimeOfDayStr()
	pass
