extends Node2D
class_name Weapon
var attack_damage := 10.0

func _ready():
	$Hitbox.visible == false
	$Hitbox/Collider.disabled = true
	
func _on_hitbox_area_entered(area):
		if area is HitboxComponent:
			var hitbox : HitboxComponent = area
			var attack = AttackComponent.new()
			attack.attack_damage = attack_damage
			attack.attack_position = global_position
			hitbox.damage(attack)

