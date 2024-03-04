extends Node

const sToMinute = 10

var timePaused = false
var gameTime = 0

enum DayNightCycle { MORNING = 06 * 60, DAY = 10 * 60, EVENING = 15 * 60, NIGHT = 20 * 60 }
const MIDNIGHT = 24 * 60
const MinuteStep = 30

var timeOfDay = 0

func _process(delta):
	if (not timePaused):
		gameTime += delta * sToMinute
		if (gameTime > MIDNIGHT):
			gameTime -= MIDNIGHT
			pass
		pass
	pass

func _init():
	pass


func GetTimeOfDayStr():
	
	var previous = DayNightCycle.keys().back()
	
	for i in DayNightCycle:
		var current = DayNightCycle[i]
		if (gameTime < current):
			return previous
		previous = i
		pass
	
	return DayNightCycle.keys().back()
	
	pass

func GetTimeOfDay():
	
	var t = GetTimeOfDayStr()
	
	return DayNightCycle[t]
	
	pass

func GameTimeStr():
	var iTime = floori(gameTime)
	
	var min = iTime / 60
	var tempSec = (iTime % 60)
	
	
	var sec = MinuteStep * (tempSec / MinuteStep)
	
	return "{min}:{sec}".format({"min": "%0*d" % [2, min], "sec": "%0*d" % [2, sec]})
