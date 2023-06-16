extends Node2D
class_name BreezeSpell

var enable = false
var selected_spell
var current_spell
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.spell = get_node("/root/BattleScene/Interface/ControlBar/Spells/Tree/ItemList")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	
#	Global.spell = get_node("/root/Interface/ControlBar/Spells/Tree/ItemList")
	print(Global.spell)

	enable = true
	if enable:
		global_position = get_global_mouse_position()
