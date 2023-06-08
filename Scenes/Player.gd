extends CharacterBody2D
class_name Player

@export var speed = 350
@onready var target = null
@onready var right_click_pos = null
#var velocity = Vector2()

func _input(event):
	if event.is_action_pressed("right_click"):
		target = get_global_mouse_position()
		_cancel_damage_text()
	if Input.is_action_just_pressed("left_click"):
		right_click_pos = get_global_mouse_position()
		_damage_text()
func _physics_process(delta):
	if target != null:
		velocity = position.direction_to(target) * speed
	# look_at(target)
		if position.distance_to(target) > 5:
			move_and_slide()
			
func _damage_text():
	if right_click_pos != null:
		$Weapon/Hitbox/Collider.disabled = false
		$DamageHint.visible = true
		$Weapon/Hitbox/Collider.visible = true
		$DamageHint.global_position = get_viewport().get_mouse_position()
		$Weapon/Hitbox/Collider.global_position = get_viewport().get_mouse_position()
		await get_tree().create_timer(0.25).timeout
		$DamageHint.global_position = global_position
		$Weapon/Hitbox/Collider.global_position = global_position
		$DamageHint.visible = false
		$Weapon/Hitbox/Collider.visible = false
		

func _cancel_damage_text():
	if Input.is_action_just_pressed("left_click"):
		$DamageHint.visible = false
		$Weapon/Hitbox/Collider.visible = false
		right_click_pos = null
