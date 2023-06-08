extends Node2D

var attack_damage := 10.0
#var knockback_force := 100.0
#var stun_time := 1.5

func _ready():
	$Hitbox.visible == false
	$Hitbox/Collider.disabled = true
	
		
func _on_hitbox_area_entered(area):
		if area is HitboxComponent:
			var hitbox : HitboxComponent = area

			var attack = AttackComponent.new()
			attack.attack_damage = attack_damage
#			attack.knockback_force = knockback_force
			attack.attack_position = global_position
#			attack.stun_time = stun_time

			hitbox.damage(attack)
		
#func _on_hitbox_input_event(viewport, event, shape_idx):
#	if $Hitbox/Collider.visible == true:
#		if event is HitboxComponent:
#			var hitbox : HitboxComponent = event
#
#			var attack = AttackComponent.new()
#			attack.attack_damage = attack_damage
#			attack.knockback_force = knockback_force
#			attack.attack_position = global_position
#			attack.stun_time = stun_time
#
#			hitbox.damage(attack)


