extends Node2D
class_name BreezeSpell

var enable = false
var selected_spell
var current_spell

var damage := 25.0

func _ready():
	self.visible = false
	
func _process(_delta):
	if Global.spell == 3:
		enable = true
		if enable:
			self.visible = true
			global_position = get_global_mouse_position()
		if enable == false:
			Global.spell = null
	if Global.spell != 3:
		self.visible = false
