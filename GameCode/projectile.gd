extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

enum GAME_STATES {
	MAIN_MENU,
	PLAY,
	PAUSED,
	GAME_OVER
}
var game_state = GAME_STATES.PLAY
func _on_player_pause_game() -> void:
	game_state = GAME_STATES.PAUSED
	$Area2D.is_paused = true


func _on_player_unpause_game() -> void:
	game_state = GAME_STATES.PLAY
	$Area2D.is_paused = false
