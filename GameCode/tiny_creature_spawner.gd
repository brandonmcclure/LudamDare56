extends Node2D

@export var player_reference: CharacterBody2D
@export var ui: Node
@export var mob_scene: PackedScene
var spawned_creature = []
var MOBS_PER_SPAWNER = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func new_game() -> void:
	print('spawning mobs')
	for i in range(1,MOBS_PER_SPAWNER):
		print('spawning mob '+str(i))
		spawn_tc()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func spawn_tc():
	# Create a new instance of the Mob scene.
	var tc_instance = mob_scene.instantiate()
	tc_instance.get_node('Mob').parent = player_reference
	var mob_spawn_location = $tc_spawn/tc_spawn_follow
	#print(mob_spawn_location)
	mob_spawn_location.progress_ratio = randf()
	tc_instance.get_node('Mob').position = mob_spawn_location.position
	tc_instance.connect('new_game_signal', _on_main_new_game_signal)
	#spawned_creature.append(mob)
	add_child(tc_instance)
	print('done spawning mob at: '+str(tc_instance.get_node('Mob').position))


func _on_main_new_game_signal() -> void:
	new_game()
