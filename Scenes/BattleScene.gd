extends Node2D
class_name BattleScene

@export var MonsterType: PackedScene
@export var MonsterAmount := 1
@export var MonsterLevel := 1
var monster
var index
var enable_spell = false
func _ready():
	for index in MonsterAmount:
		monster = MonsterType.instantiate()
		monster.position = Vector2(randf_range(50,150), randf_range(350,500) + 10 * index)
		monster.MonsterLevel = MonsterLevel
		add_child(monster)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spell_enable(spell : SpellComponent):
	enable_spell = spell.enable
	
func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	if index == 2:
		pass
