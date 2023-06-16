extends Node2D
class_name SpellComponent

@export var SpellType: PackedScene
var enable
var selected_spell
var current_spell

var water
var fire
var earth
var wind
var holy
var dark

# Called when the node enters the scene tree for the first time.
func _process(delta):
	global_position = get_global_mouse_position()

	
