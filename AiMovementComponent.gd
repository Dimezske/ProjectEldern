extends Node2D
class_name AiMovementComponent

@export var speed = 200
@export var attackDistance = 100
@export var movementInterval = 2  # Time interval for changing movement direction

var target: Node2D
var timer = 0.0
var direction = Vector2.ZERO
var screen_size
func _ready():
	screen_size = get_viewport_rect().size
	target = get_node("/root/BattleScene/Player")  # Change "/root/Player" to the path of your player character node
	randomize()
	changeDirection()

func _process(delta):
	var distance = target.global_position.distance_to(global_position)

	if distance > attackDistance:
		get_parent().move_and_collide(direction * speed * delta)

	if distance <= attackDistance:
		attack()

	timer += delta
	if timer >= movementInterval:
		changeDirection()
		timer = 0.0

func changeDirection():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func attack():
	
	# Implement your attack logic here
#	target -= attack.attack_damage
	print("Attacking!")
	# Add your attack code, such as spawning projectiles or applying damage to the player

func randomizeTimer():
	$AttackTimer.wait_time = randf_range(1,10)
	$AiAttackComponent/Hitbox.visible == true
	$AiAttackComponent/Hitbox/Collider.disabled = true
	
func _on_attack_timer_timeout():
	randomizeTimer()
	
