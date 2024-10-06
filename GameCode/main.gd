extends Node
class_name Game


static var ref : Game
var score
var bg_music := AudioStreamPlayer.new()
signal new_game_signal
signal main_menu
func _enter_tree() -> void:
	if ref:
		queue_free()
		return
	ref = self
# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.emit()


func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()
func new_game():
	get_tree().call_group("mobs", "queue_free")
	new_game_signal.emit()
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


func _on_player_hit():
	game_over()


func _on_new_game_signal() -> void:
	pass # Replace with function body.
