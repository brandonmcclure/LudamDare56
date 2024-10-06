extends Node

var debug = true
var is_invincible = true
var is_attackphase = false

@onready var animation_controller = $AnimatedSprite2D

# What does this guy need to do? 
# He needs to add to a sense of scale. Make the tiny creatures relevent
# He needs to be invincible most of the time, and when his mouth is open during an attack he can be clicked on
# He needs to attack with his flippers from the lest or right
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_controller.frame = 0
	start_play()
	new_game()

func start_play() -> void:
	$anim_timer.start()
func _physics_process(_delta: float) -> void:
	$AnimatedSprite2D/debug_label.text = ""
	if debug:
		$AnimatedSprite2D/debug_label.text += "big guy"


func new_game() -> void:
	$AnimatedSprite2D/health_bar.value = 100

func start_attack() -> void:
	pass
	# start opening mouth
	# is it coming from left or right?
	# start attack animation for flipper on that side
	# move the flipper across the board
func _on_anim_timer_timeout() -> void:
	if animation_controller.frame < 2:
		animation_controller.frame = animation_controller.frame + 1
	else:
		animation_controller.frame = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	print('gehrh')
	print(body)
	$AnimatedSprite2D/health_bar.value -= 10
