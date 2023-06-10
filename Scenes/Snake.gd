extends Node2D
class_name Snake

var MonsterAmount := 1
var MonsterLevel := 1

var MAX_HEALTH := 20.0
var health

var taking_damage := false
var attacking = false

func _ready():
	health = MAX_HEALTH
	var t = get_tree().create_tween()
	t.tween_property(self, "global_position", $AiMovementComponent.target.global_position + Vector2(randf_range(-30,30), randf_range(-30,30)), 3)
	t.tween_property(self, "global_position", $AiMovementComponent.target.global_position + Vector2(randf_range(-30,30), randf_range(-30,30)), 3)

func _process(delta):
	pass #pass animations
 
func _on_hitbox_component_input_event(viewport, event, shape_idx):
	print(event)

func _attack():
	$Weapon/Hitbox/Collider.disabled = false
	$Weapon/Hitbox/Collider.visible = true
	attacking = true
	await get_tree().create_timer(0.25).timeout
	attacking = false
	$Weapon/Hitbox/Collider.visible = false
	$Weapon/Hitbox/Collider.disabled = true
#extends Node2D
#class_name Snake
#
#var MonsterAmount := 1
#var MonsterLevel := 1
#
#var MAX_HEALTH := 20.0
#var health
#
#var taking_damage := false
#
#func _ready():
#	health = MAX_HEALTH
#
#func _process(delta):
#	pass #pass animations
#
#func _on_hitbox_component_input_event(viewport, event, shape_idx):
#	print(event)
#
#func _attack():
#	$Weapon/Hitbox/Collider.disabled = false
#	$Weapon/Hitbox/Collider.visible = true
#	await get_tree().create_timer(0.25).timeout
#	$Weapon/Hitbox/Collider.visible = false
#	$Weapon/Hitbox/Collider.disabled = true
