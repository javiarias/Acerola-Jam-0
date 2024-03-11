class_name Inventory
extends Node

var items = []
const max = 9
var selected = 0


func TryChangeSelected(i):
	if i <= max:
		selected = i - 1
		
		#TODO update visuals
		
		pass
	pass
