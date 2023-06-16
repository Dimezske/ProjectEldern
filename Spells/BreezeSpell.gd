extends Node2D
class_name BreezeSpell

var enable = false
var selected_spell
var current_spell
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	selected_spell = get_node("/root/BattleScene/Interface/ControlBar/Spells/Tree/ItemList")

	if selected_spell.item_clicked(2):
		current_spell = self
		enable = true
		if enable:
			global_position = get_global_mouse_position()
