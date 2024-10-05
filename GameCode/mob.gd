extends CharacterBody2D

@export var parent : CharacterBody2D
var speed = 50
var debug = true

@onready var follow_point = parent.get_node("AnimatedSprite2D/FollowPoint")

func _physics_process(_delta):
	
	var target = follow_point.global_position
	var distance_to_target = position.distance_to(target)
	$debug_label.text = ""
	if debug:
		$debug_label.text += "x: "+str($CollisionShape2D.global_position.x)+"\n"
		$debug_label.text += "y: "+str($CollisionShape2D.global_position.y)+"\n"
		$debug_label.text += "distance_to_target: "+str(distance_to_target)+"\n"
		
	velocity = Vector2.ZERO
	if  distance_to_target < 400 and distance_to_target > 50:
		velocity = position.direction_to(target) * speed

	move_and_slide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
