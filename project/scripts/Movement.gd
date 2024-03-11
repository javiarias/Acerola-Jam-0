class_name Movement
extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 3
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

@export var Sprite : AnimatedSprite3D

var target_velocity = Vector3.ZERO

var wasPaused = true

enum MoveDir { UP, DOWN, LEFT, RIGHT }

var currentDir = MoveDir.DOWN
var moveDir = Vector3.ZERO

func _process(delta):

	moveDir = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		moveDir.x += 1
	elif Input.is_action_pressed("move_left"):
		moveDir.x -= 1
		
	if Input.is_action_pressed("move_down"):
		moveDir.z += 1
	if Input.is_action_pressed("move_up"):
		moveDir.z -= 1

	if moveDir == Vector3.ZERO:
		Sprite.set_frame(1)
		Sprite.pause()
		wasPaused = true
		return
	else:
		moveDir = moveDir.normalized()
		
		if wasPaused:
			Sprite.set_frame(0)
			wasPaused = false
			Sprite.play()
			pass
		
		if moveDir.z >= 0.5:
			if currentDir != MoveDir.DOWN:
				Sprite.set_animation("down")
				currentDir = MoveDir.DOWN
				pass
			pass
		elif moveDir.z <= -0.5:
			if currentDir != MoveDir.UP:
				Sprite.set_animation("up")
				currentDir = MoveDir.UP
				pass
			pass
		elif moveDir.x >= 0.5:
			if currentDir != MoveDir.RIGHT:
				Sprite.set_animation("right")
				currentDir = MoveDir.RIGHT
				pass
			pass
		elif moveDir.x <= -0.5:
			if currentDir != MoveDir.LEFT:
				Sprite.set_animation("left")
				currentDir = MoveDir.LEFT
				pass
			pass
	
	
	
	pass


func _physics_process(delta):
	
	# Ground Velocity
	target_velocity.x = moveDir.x * speed * delta
	target_velocity.z = moveDir.z * speed * delta

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	pass
