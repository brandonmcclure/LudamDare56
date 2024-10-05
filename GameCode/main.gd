extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
#func _ready():
#	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()
func new_game():
	get_tree().call_group("mobs", "queue_free")
	score = 0
	$player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	for i in range(1,5):
		spawn_tc()
func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$ScoreTimer.start()
func spawn_tc():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	mob.parent = get_node("player")
	mob.speed = 50

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	print(mob_spawn_location)
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_player_hit():
	game_over()
