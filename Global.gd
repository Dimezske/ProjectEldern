extends Node

var data: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	data.wild_player_position = Vector2()
	
func save():
	var file = FileAccess.open("res://Data/save_game.txt", FileAccess.WRITE)
	var string = var_to_str(data)
	assert(!data.is_empty())
	assert(string.length() > 0)
	print(string)
	file.store_string(string)
	file.close()
	
func load():
	var file = FileAccess.open("res://Data/save_game.txt", FileAccess.READ)
	var string = file.get_as_text()
	data = str_to_var(string)
	file.close()
