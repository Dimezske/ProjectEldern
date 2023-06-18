extends Node2D
class_name SpellComponent

@export var SpellType: PackedScene
var enable
var selected_spell
var current_spell

var damage
var travel_speed
var damage_multiplyer
var damage_per_second
var duration
var enemy_target
var take_damage
var monster

func _process(delta):
	global_position = get_global_mouse_position()


func damage_enemy(enemy_target : SpellComponent, delta):
	monster.take_damage(damage_per_second * delta, enemy_target, 0, self)
	travel_speed = 20.0
	Global.damage = damage
	
func _on_damage_timer_timeout():
	duration = $DamageTimer


func _on_spell_hitbox_body_entered(body):
	damage_enemy()
