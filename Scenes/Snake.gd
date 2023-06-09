extends Node2D
class_name Snake

var MonsterAmount := 1
var MonsterLevel := 1

var MAX_HEALTH := 20.0
var health

var taking_damage := false

func _ready():
	health = MAX_HEALTH

func _process(delta):
	pass #pass animations
 
func _on_hitbox_component_input_event(viewport, event, shape_idx):
	print(event)

func _attack():
	$Weapon/Hitbox/Collider.disabled = false
	$Weapon/Hitbox/Collider.visible = true
	await get_tree().create_timer(0.25).timeout
	$Weapon/Hitbox/Collider.visible = false
	$Weapon/Hitbox/Collider.disabled = true
