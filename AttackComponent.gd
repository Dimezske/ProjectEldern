extends Node2D
class_name AttackComponent

@export var MAX_ATTACK := 10.0
var attack_damage : float
#var knockback_force = 2.0
var attack_position = global_position
#var stun_time = 1.0

func _ready():
	attack_damage = MAX_ATTACK

