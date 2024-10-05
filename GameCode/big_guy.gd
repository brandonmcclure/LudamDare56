extends Node

var debug = true
var is_invincible = true

@onready var hitbox = $Parallax2D/Area2D/hitbox
@onready var animation_controller = $Parallax2D/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_controller.frame = 0
	start_play()
	new_game()

func start_play() -> void:
	$anim_timer.start()
func _physics_process(delta: float) -> void:
	$debug_label.text = ""
	if debug:
		$debug_label.text += "big guy"


func new_game() -> void:
	$health_bar.value = 100


func _on_anim_timer_timeout() -> void:
	if animation_controller.frame < 2:
		animation_controller.frame = animation_controller.frame + 1
	else:
		animation_controller.frame = 0
