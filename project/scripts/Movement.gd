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


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	if Input.is_action_pressed("move_down"):
		direction.z += 1
	if Input.is_action_pressed("move_up"):
		direction.z -= 1

	if direction == Vector3.ZERO:
		Sprite.set_frame(1)
		Sprite.pause()
		wasPaused = true
		return
	else:
		direction = direction.normalized()
		
		if wasPaused:
			Sprite.set_frame(0)
			wasPaused = false
			Sprite.play()
			pass
		
		if direction.z >= 0.5:
			if currentDir != MoveDir.DOWN:
				Sprite.set_animation("down")
				currentDir = MoveDir.DOWN
				pass
			pass
		elif direction.z <= -0.5:
			if currentDir != MoveDir.UP:
				Sprite.set_animation("up")
				currentDir = MoveDir.UP
				pass
			pass
		elif direction.x >= 0.5:
			if currentDir != MoveDir.RIGHT:
				Sprite.set_animation("right")
				currentDir = MoveDir.RIGHT
				pass
			pass
		elif direction.x <= -0.5:
			if currentDir != MoveDir.LEFT:
				Sprite.set_animation("left")
				currentDir = MoveDir.LEFT
				pass
			pass
		

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	pass
