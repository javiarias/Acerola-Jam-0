extends Node

@export var toolIndicator : Sprite3D
@export var gridMap : GridMap
@export var movement : Movement
var displayIndicator = true

var inventory = Inventory.new()

var currentTile


func _process(delta):
	
	if displayIndicator:
		currentTile = gridMap.local_to_map(movement.position)
		currentTile.y = 0
		match movement.currentDir:
			Movement.MoveDir.UP:
				currentTile.z -= 1
				pass
			Movement.MoveDir.DOWN:
				currentTile.z += 1
				pass
			Movement.MoveDir.LEFT:
				currentTile.x -= 1
				pass
			Movement.MoveDir.RIGHT:
				currentTile.x += 1
				pass
		
		var pos = gridMap.map_to_local(currentTile)
		
		pos.y = 0
		toolIndicator.global_position = pos
		
		#TODO: CHECK IF YOU CAN TILL SOIL
		pass
	
	pass

func _input(event):
	if currentTile == null:
		return
	
	if event.is_action_pressed("use"):
		useTool()
		pass
	elif event is InputEventKey and event.pressed:
		if event.keycode == KEY_KP_1 or event.keycode == KEY_1:
			inventory.TryChangeSelected(1)
		elif event.keycode == KEY_KP_2 or event.keycode == KEY_2:
			inventory.TryChangeSelected(2)
		elif event.keycode == KEY_KP_3 or event.keycode == KEY_3:
			inventory.TryChangeSelected(3)
		elif event.keycode == KEY_KP_4 or event.keycode == KEY_4:
			inventory.TryChangeSelected(4)
		elif event.keycode == KEY_KP_5 or event.keycode == KEY_5:
			inventory.TryChangeSelected(5)
		elif event.keycode == KEY_KP_6 or event.keycode == KEY_6:
			inventory.TryChangeSelected(6)
		elif event.keycode == KEY_KP_7 or event.keycode == KEY_7:
			inventory.TryChangeSelected(7)
		elif event.keycode == KEY_KP_8 or event.keycode == KEY_8:
			inventory.TryChangeSelected(8)
		elif event.keycode == KEY_KP_9 or event.keycode == KEY_9:
			inventory.TryChangeSelected(9)
		pass
	pass 


func useTool():
	if true:
		var can = false
		var tile = gridMap.get_cell_item(currentTile)
		if tile > 0:
			var aux = gridMap.mesh_library.get_item_name(gridMap.get_cell_item(currentTile))
			can = aux == "Tillable"
			pass
		print(can)
		#TODO: SPAWN TILLED SOIL OBJECT?
		pass
	#TODO: start music play?
	#TODO: plant?
	#TODO: water?
	pass
