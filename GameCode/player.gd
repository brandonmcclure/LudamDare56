extends CharacterBody2D
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()


var current_zoom = Vector2(1,1)
var air_jump = false
var just_wall_jumped = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var was_wall_normal = Vector2.ZERO

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var starting_position = global_position
@onready var camera = $Camera2D

func _physics_process(_delta):
	var input_axis = Input.get_axis("ui_left", "ui_right")
	
	# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
	var zoom_factor := 0.5
	if Input.is_action_just_released('zoom_out'):
		current_zoom = current_zoom * zoom_factor
		
	elif Input.is_action_just_released('zoom_in'):
		current_zoom = -(current_zoom * zoom_factor)
		
	if current_zoom <= Vector2.ZERO:
		current_zoom = Vector2(0.1,0.1)
	if current_zoom > Vector2(1.5,1.5):
			current_zoom = Vector2(1.5,1.5)
	camera.zoom = current_zoom
	move_and_slide()
	update_animations(input_axis)
	$debug_label.text = ""
	$debug_label.text += "x: "+str($CollisionShape2D.global_position.x)+"\n"
	$debug_label.text += "y: "+str($CollisionShape2D.global_position.y)+"\n"



func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
