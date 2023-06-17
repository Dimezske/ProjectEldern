extends CharacterBody2D
class_name WildPlayer

@export var speed: float = 2.5
var initial_position = true
var player_position = Vector2()
var motion: Vector2 = Vector2.ZERO
var player_isRunning : bool
var player_direction = 0
var facing

func _ready():
	player_position = Global.data.wild_player_position
func _physics_process(delta: float) -> void:
	player_position = global_transform.origin
	# Get keyboard input
	if initial_position: # Initial value
		Global.load()
		player_position = Global.data.wild_player_position
		global_transform.origin = player_position
		initial_position = false

	if Input.is_action_pressed("sprint"):
		player_isRunning = true 
		speed = 3.5
		pass
	else:
		speed = 2.5
	
	motion = Vector2.ZERO
	if Input.is_action_pressed("move-right"):
		motion.x -= 1
		player_direction = 0
		facing = Vector2(1,0)
		$Animation2D.animation = "Walk_East"
		$Animation2D.flip_h = true
		$Animation2D.play()
		# Hair Animation
		$AnimatedHair2D.animation = "Walk_Hair_East"
		$AnimatedHair2D.flip_h = true
		$AnimatedHair2D.play()
		
	if Input.is_action_pressed("move-left"):
		motion.x += 1
		player_direction = 1
		facing = Vector2(-1,0)
		$Animation2D.animation = "Walk_West"
		$Animation2D.flip_h = false
		$Animation2D.play()
		# Hair Animation
		$AnimatedHair2D.animation = "Walk_Hair_West"
		$AnimatedHair2D.flip_h = false
		$AnimatedHair2D.play()
		
	if Input.is_action_pressed("move-down"):
		motion.y += 1
		player_direction = 2
		facing = Vector2(0,1)
		$Animation2D.animation = "Walk_South"
		$Animation2D.play()
		# Hair Animation
		$AnimatedHair2D.animation = "Walk_Hair_South"
		$AnimatedHair2D.play()
		
	if Input.is_action_pressed("move-up"):
		motion.y -= 1
		player_direction = 3
		facing = Vector2(0,-1)
		$Animation2D.animation = "Walk_North"
		$Animation2D.play()
		# Hair Animation
		$AnimatedHair2D.animation = "Walk_Hair_North"
		$AnimatedHair2D.play()
		
	if motion == Vector2.ZERO:
		if player_direction == 0:
			$Animation2D.animation = "Idle_East"
			$Animation2D.play()
			# Hair Animation
			$AnimatedHair2D.animation = "Idle_Hair_East"
			$AnimatedHair2D.play()
		if player_direction == 1:
			$Animation2D.animation = "Idle_West"
			$Animation2D.play()
			# Hair Animation
			$AnimatedHair2D.animation = "Idle_Hair_West"
			$AnimatedHair2D.play()
		if player_direction == 2:
			$Animation2D.animation = "Idle_South"
			$Animation2D.play()
			# Hair Animation
			$AnimatedHair2D.animation = "Idle_Hair_South"
			$AnimatedHair2D.play()
		if player_direction == 3:
			$Animation2D.animation = "Idle_North"
			$Animation2D.play()
			# Hair Animation
			$AnimatedHair2D.animation = "Idle_Hair_North"
			$AnimatedHair2D.play()
	# Normalize the motion vector to maintain consistent speed in all directions
	motion = motion.normalized() * speed

	# Move the player
	move_and_collide(motion)

	if player_position != Global.data.wild_player_position:
		Global.data.wild_player_position = player_position
		print(player_position)
		Global.save()
