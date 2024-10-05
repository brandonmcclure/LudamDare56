extends CharacterBody2D

@export var parent : CharacterBody2D
var speed = 25

@onready var follow_point = parent.get_node("AnimatedSprite2D/FollowPoint")

func _physics_process(delta):
	var target = follow_point.global_position
	velocity = Vector2.ZERO
	if position.distance_to(target) > 5:
		velocity = position.direction_to(target) * speed


	move_and_slide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
