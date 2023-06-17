extends Node

var current_scene: Node = null

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func change_scene_to(packed_scene_path: String) -> Node:
	if current_scene:
		current_scene.queue_free()
	var packed_scene: PackedScene = load(packed_scene_path)
	current_scene = packed_scene.instantiate()
	assert(current_scene)
#	get_tree().root.call_deferred("add_child", current_scene)
	get_tree().change_scene_to_file("res://Scenes/BattleScene.tscn")
	return current_scene
