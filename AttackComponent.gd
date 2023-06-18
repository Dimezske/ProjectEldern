extends Node2D
class_name AttackComponent

@export var MAX_ATTACK := 10.0
var attack_damage : float
var spell_attack_damage : float
var attack_position = global_position

func _ready():
	attack_damage = MAX_ATTACK
	spell_attack_damage = MAX_ATTACK
