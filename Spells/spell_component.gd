extends Node2D
class_name SpellComponent

@export var SpellType: PackedScene
var enable
var selected_spell
var current_spell

func _process(delta):
	global_position = get_global_mouse_position()
