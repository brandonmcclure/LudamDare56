extends Node

@export var mob_scene: PackedScene
var score

@onready var map_collision = $map_sb2d/map_collision
@onready var map_polygon = $map_sb2d/map_collision/map_polygon
# Called when the node enters the scene tree for the first time.
func _ready():
	map_polygon.polygon = map_collision.polygon
#	new_game()


func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()
func new_game():
	#get_tree().call_group("mobs", "queue_free")
	score = 0
	$player.start($StartPosition.position)
	get_tree().paused = false
	$StartTimer.start()
	$HUD.update_score(score)
func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$ScoreTimer.start()
func spawn_tc():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()


func _on_player_hit():
	game_over()
