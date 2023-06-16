extends Node2D
class_name Reener

var MonsterAmount := 1
var MonsterLevel := 1

var MAX_HEALTH := 20.0
var health

var taking_damage := false
var attacking = false


func _ready():
	health = MAX_HEALTH
	$ChargeTimer.start(randf_range(0.5, 3))

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

func _charge():
	var monster_position = Vector2(self.global_position.x, self.global_position.y)
	var t = get_tree().create_tween()
	t.tween_property(self, "global_position", $AiMovementComponent.target.global_position, 1)
	t.tween_callback(func(): _attack())
	t.tween_property(self, "global_position", monster_position, 1)
	t.tween_callback(func(): $ChargeTimer.start(1))
	
	
func _on_charge_timer_timeout():
	await get_tree().create_timer(0.25).timeout
	_charge()


