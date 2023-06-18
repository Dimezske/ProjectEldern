extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

func damage(attack: AttackComponent):
	if health_component:
		health_component.damage(attack)

func spell_damage(spell_attack: AttackComponent):
	if health_component:
		health_component.damage(spell_attack)

