extends Node2D
class_name AiMovementComponent

@export var speed = 200
@export var attackDistance = 100
@export var movementInterval = 2  # Time interval for changing movement direction
@export var vision_range = 500 # How far the enemy can see.

var target: Node2D
var timer = 0.0
var direction = Vector2.ZERO
var screen_size
var chasing : bool = false

func _ready():
	screen_size = get_viewport_rect().size
	target = get_node("/root/BattleScene/Player")  # Change "/root/Player" to the path of your player character node
	randomize()
#	changeDirection()
	
	$Vision/CollisionShape2D.shape.radius = vision_range

func _process(delta):
	pass
# DO NOT DELETED THESE COMMENTS
# DO NOT DELETED THESE COMMENTS
# DO NOT DELETED THESE COMMENTS
# DO NOT DELETED THESE COMMENTS
# DO NOT DELETED THESE COMMENTS

#	var distance = target.global_position.distance_to(global_position)

#    if distance > attackDistance:
#        get_parent().move_and_collide(direction * speed * delta)
#	if distance <= attackDistance:
#		attack()

#	if chasing:
#		get_parent().move_and_collide(get_parent().global_position.direction_to(target.global_position) * speed * delta)
#
#	timer += delta
#	if timer >= movementInterval && !chasing:
#		changeDirection()
#		timer = 0.0
#
#func changeDirection():
#	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)

func attack():
	if get_parent().attacking == false:
		# Implement your attack logic here
	#    target -= attack.attack_damage
		print("Attacking!")
		# Add your attack code, such as spawning projectiles or applying damage to the player
		get_parent()._attack()

func randomizeTimer():
	$AttackTimer.wait_time = randf_range(1,2)
	$AiAttackComponent/Hitbox.visible == true
	$AiAttackComponent/Hitbox/Collider.disabled = true

func _on_attack_timer_timeout():
	randomizeTimer()
	


func _on_vision_body_entered(body):
	if body == target:
		chasing = true


func _on_vision_body_exited(body):
	if body == target:
		chasing = false
#extends Node2D
#class_name AiMovementComponent
#
#@export var speed = 200
#@export var attackDistance = 100
#@export var movementInterval = 2  # Time interval for changing movement direction
#@export var vision_range = 500 # How far the enemy can see.
#
#var target: Node2D
#var timer = 0.0
#var direction = Vector2.ZERO
#var screen_size
#var chasing : bool = false
#
#func _ready():
#	screen_size = get_viewport_rect().size
#	target = get_node("/root/BattleScene/Player")  # Change "/root/Player" to the path of your player character node
#	randomize()
#	changeDirection()
#
#	$Vision/CollisionShape2D.shape.radius = vision_range
#
#func _process(delta):
#	var distance = target.global_position.distance_to(global_position)
#
#	if distance > attackDistance:
#		get_parent().move_and_collide(direction * speed * delta)
#
#	if distance <= attackDistance:
#		attack()
#
#	timer += delta
#	if timer >= movementInterval:
#		changeDirection()
#		timer = 0.0
#
#func changeDirection():
#	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
#
#func attack():
#	print("Attacking!")
#	get_parent()._attack()
#
#
#func randomizeTimer():
#	$AttackTimer.wait_time = randf_range(1,2)
#	$AiAttackComponent/Hitbox.visible == true
#	$AiAttackComponent/Hitbox/Collider.disabled = true
#
#func _on_attack_timer_timeout():
#	randomizeTimer()
#
#func _on_vision_body_entered(body):
#	if body == target:
#		chasing = true
#
#
#func _on_vision_body_exited(body):
#	if body == target:
#		chasing = false
