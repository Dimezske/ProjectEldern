extends Node2D


var movementSpeed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#func _process(delta):
#	var player = get_node("/root/BattleScene/Player")
#	var direction = (player.global_position - global_position).normalized()
#	get_parent().move_and_collide(direction * movementSpeed * delta)
