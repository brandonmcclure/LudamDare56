extends Node

var debug = false
var is_invincible = true
var is_attackphase = false
signal on_dead
@onready var animation_controller = $AnimatedSprite2D
enum GAME_STATES {
	MAIN_MENU,
	PLAY,
	PAUSED,
	GAME_OVER
}
var game_state = GAME_STATES.MAIN_MENU
# What does this guy need to do? 
# He needs to add to a sense of scale. Make the tiny creatures relevent
# He needs to be invincible most of the time, and when his mouth is open during an attack he can be clicked on
# He needs to attack with his flippers from the lest or right
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_controller.frame = 0
	new_game()
	
func _physics_process(_delta: float) -> void:
	if game_state == GAME_STATES.PAUSED:
		return
	$AnimatedSprite2D/debug_label.text = ""
	if debug:
		$AnimatedSprite2D/debug_label.text += "big guy"


func new_game() -> void:
	$anim_timer.start()
	game_state = GAME_STATES.PLAY
	$AnimatedSprite2D/health_bar.value = 100

func start_attack() -> void:
	pass
	# start opening mouth
	# is it coming from left or right?
	# start attack animation for flipper on that side
	# move the flipper across the board
func _on_anim_timer_timeout() -> void:
	if game_state == GAME_STATES.PAUSED:
		return
	if animation_controller.frame < 2:
		animation_controller.frame = animation_controller.frame + 1
	else:
		animation_controller.frame = 0


func _on_area_2d_area_entered(_area: Area2D) -> void:
	if game_state == GAME_STATES.PAUSED:
		return
	$audio_on_hit.play()
	$AnimatedSprite2D/health_bar.value -= 10
	if $AnimatedSprite2D/health_bar.value <= 0:
		on_dead.emit()


func _on_hud_start_game() -> void:
	new_game()


func _on_player_pause_game() -> void:
	game_state = GAME_STATES.PAUSED


func _on_player_unpause_game() -> void:
	game_state = GAME_STATES.PLAY
