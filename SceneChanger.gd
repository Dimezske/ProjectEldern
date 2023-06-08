extends Node

var current_scene: Node = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
