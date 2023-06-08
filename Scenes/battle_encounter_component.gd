extends Area2D
class_name BattleEncounterComponent

@export var MonsterType: PackedScene
@export var MonsterAmount := 1
@export var MonsterLevel := 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomizeTimer()
	$Timer/TimeRemaining.text = "%s" % roundf($Timer.time_left)

func randomizeTimer():
	$Timer.wait_time = randf_range(1,10)
	
func toggle_area():
	if $AreaCollision.visible:
		$AreaCollision.hide()
	else:
		$AreaCollision.show()

func _on_body_entered(body):
	print(body)
	if body is WildPlayer:
		var timer = get_tree().create_timer(10)
		timer.timeout.connect(start_battle)
		var player : WildPlayer = body
#		var battle := SceneChanger.change_scene_to("res://Scenes/BattleScene.tscn")
#		assert(battle) 
#		battle.MonsterType = MonsterType
#		battle.MonsterAmount = MonsterAmount
#		battle.MonsterLevel = MonsterLevel
		
func start_battle(): # Start battle here
	var battle := SceneChanger.change_scene_to("res://Scenes/BattleScene.tscn")
	assert(battle) 
	battle.MonsterType = MonsterType
	battle.MonsterAmount = MonsterAmount
	battle.MonsterLevel = MonsterLevel

func _on_timer_timeout():
	toggle_area()
	
#func _on_body_entered(body):
#	print(body)
#	if body is WildPlayer:
#		var player : WildPlayer = body
#		var battle := preload("res://Scenes/BattleScene.tscn").instantiate()
#		battle.MonsterType = MonsterType
#		battle.MonsterAmount = MonsterAmount
#		battle.MonsterLevel = MonsterLevel
#		var current_root = get_tree().root
#		get_tree().root.add_child(battle)
##		current_root.queue_free()
#func _on_area_entered(area):
#	print(area)
#	if area is WildPlayer:
#		var player : WildPlayer = area
#		print(area)
#		get_tree().change_scene_to_file("res://Scenes/World.tscn")
