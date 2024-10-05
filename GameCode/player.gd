extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var debug = true
var current_zoom = Vector2(1,1)
var air_jump = false
var just_wall_jumped = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var was_wall_normal = Vector2.ZERO

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var starting_position = global_position
@onready var camera = $Camera2D

func _physics_process(delta: float) -> void:
	$debug_label.text = ""
	if debug:
		$debug_label.text += "x: "+str($CollisionShape2D.global_position.x)+"\n"
		$debug_label.text += "y: "+str($CollisionShape2D.global_position.y)+"\n"
		$debug_label.text += "current zoom: "+str(current_zoom)+"\n"
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var zoom_factor := 0.5
	if Input.is_action_just_released('zoom_out'):
		current_zoom = -(current_zoom * zoom_factor)
	elif Input.is_action_just_released('zoom_in'):
		current_zoom = current_zoom * zoom_factor
		
	if current_zoom < Vector2(0.5,0.5):
		current_zoom = Vector2(0.5,0.5)
	if current_zoom > Vector2(2,2):
		current_zoom = Vector2(2,2)
	camera.zoom = current_zoom
	var input_axis = Input.get_axis("ui_left", "ui_right")
	

	update_animations(input_axis)
	move_and_slide()

var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()






func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
