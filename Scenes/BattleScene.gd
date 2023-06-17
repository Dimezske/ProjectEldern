extends Node2D
class_name BattleScene

@export var MonsterType: PackedScene
@export var MonsterAmount := 1
@export var MonsterLevel := 1
var monster
var index

func _ready():
	for index in MonsterAmount:
		monster = MonsterType.instantiate()
		monster.position = Vector2(randf_range(50,150), randf_range(350,500) + 10 * index)
		monster.MonsterLevel = MonsterLevel
		add_child(monster)

func _process(delta):
	pass

func _on_item_list_item_selected(index):
	print("selected", index)
	if index == 0:
		print(index, " water")
		Global.spell = index
		print(Global.spell)
	if index == 1:
		print(index, " fire")
		Global.spell = index
	if index == 2:
		print(index, " earth")
		Global.spell = index
	if index == 3:
		print(index, " wind")
		Global.spell = index
	if index == 4:
		print(index, " holy")
		Global.spell = index
	if index == 5:
		print(index, " dark")
		Global.spell = index
