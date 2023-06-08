extends Node2D

@export var MonsterType: PackedScene
@export var MonsterAmount := 1
@export var MonsterLevel := 1

func _ready():
	for index in MonsterAmount:
		var monster := MonsterType.instantiate()
		monster.position = Vector2(100, 100 + 10 * index)
		monster.MonsterLevel = MonsterLevel
		add_child(monster)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
