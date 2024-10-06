extends Node
class_name Game

@export var mob_scene: PackedScene
static var ref : Game
var score

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
	ref = self
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	new_game()


func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()
func new_game():
	score = 0
	$player.start()
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
	var _mob = mob_scene.instantiate()


func _on_player_hit():
	game_over()
