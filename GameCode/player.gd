extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const CAMERA_MOVEMENT_SPEED : float = 10
const CAMERA_ZOOM_SPEED : Vector2 = Vector2(0.6, 0.6)
const CAMERA_ZOOM_DEFAULT : Vector2 = Vector2(1.0, 1.0)
const CAMERA_ZOOM_MIN : Vector2 = Vector2(0.05, 0.05)
const CAMERA_ZOOM_MAX : Vector2 = Vector2(2.0, 2.0)
var zoom_int : int = 0
var debug = true
var current_zoom = Vector2(1,1)
var air_jump = false
var just_wall_jumped = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var was_wall_normal = Vector2.ZERO

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var starting_position = global_position
@onready var camera = $Camera2D

@export var projectile : PackedScene
@export var UI : CanvasLayer
@export var start_point: Marker2D

signal new_game

enum GAME_STATES {
	MAIN_MENU,
	PLAY,
	PAUSED,
	GAME_OVER
}
var game_state = GAME_STATES.MAIN_MENU
func _physics_process(delta: float) -> void:
	
	var distance_from_reference = camera.get_zoom().distance_to(Vector2(1,1))
	if camera.get_zoom() > Vector2(1, 1):
		zoom_int = int(distance_from_reference) -1
	elif camera.get_zoom() < Vector2(1, 1):
		zoom_int = -int(distance_from_reference) + 1
	else:
		zoom_int = 0
	if (Input.is_action_just_pressed("zoom_in")):
		if (camera.get_zoom() < CAMERA_ZOOM_MAX):
			camera.set_zoom(camera.get_zoom() * (CAMERA_ZOOM_DEFAULT + CAMERA_ZOOM_SPEED))
		
	elif (Input.is_action_just_pressed("zoom_out")):
		if (camera.get_zoom() > CAMERA_ZOOM_MIN):
			camera.set_zoom(camera.get_zoom() / (CAMERA_ZOOM_DEFAULT + CAMERA_ZOOM_SPEED))
			
	$debug_label.text = ""
	if debug:
		$debug_label.text += "x: "+str($CollisionShape2D.global_position.x)+"\n"
		$debug_label.text += "y: "+str($CollisionShape2D.global_position.y)+"\n"
		$debug_label.text += "current zoom: "+str(camera.get_zoom())+"\n"
		$debug_label.text += "current zoom int: "+str(zoom_int)+"\n"
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("walk_left", "walk_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
		
	#elif (Input.is_action_just_pressed("Camera_ZoomReset")):
		#camera.set_zoom(CAMERA_ZOOM_DEFAULT)
	var input_axis = Input.get_axis("ui_left", "ui_right")
	
	look_at(get_global_mouse_position())
	update_animations(input_axis)
	move_and_slide()

var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$Camera2D/resume_button.visible = false
	$Camera2D/quit_button.visible = false
	$Camera2D/restart_button.visible = false
	hide()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var b = projectile.instantiate()
				b.transform = $projectile_source.transform
				b.look_at(event.position)
				owner.add_child(b)
				
	if Input.is_action_just_pressed("ui_menu") or Input.is_action_just_pressed("menu"):
		print('esc')
		if game_state == GAME_STATES.PAUSED:
			_unpause_game()
		elif game_state == GAME_STATES.PLAY:
			_pause_game()


func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)

func start():
	position = start_point.position
	show()
	_unpause_game()
	$CollisionShape2D.disabled = false

func _pause_game() -> void:
	game_state = GAME_STATES.PAUSED
	get_tree().paused = true
	$Camera2D/resume_button.visible = true
	$Camera2D/quit_button.visible = true
	$Camera2D/restart_button.visible = true
func _unpause_game() -> void:
	get_tree().paused = false
	game_state = GAME_STATES.PLAY
	$Camera2D/resume_button.visible = false
	$Camera2D/quit_button.visible = false
	$Camera2D/restart_button.visible = false
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_resume_button_pressed() -> void:
	print('here')
	_unpause_game()


func _on_restart_button_pressed() -> void:
	new_game.emit()


func _on_new_game() -> void:
	start()
