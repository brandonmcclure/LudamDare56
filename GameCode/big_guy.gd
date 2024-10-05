extends Node

var debug = true
var is_invincible = true

@onready var hitbox = $Parallax2D/Area2D/hitbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

func _physics_process(delta: float) -> void:
	$debug_label.text = ""
	if debug:
		$debug_label.text += "big guy"

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
func new_game() -> void:
	$health_bar.value = 100
