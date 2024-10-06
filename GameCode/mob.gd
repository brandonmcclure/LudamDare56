extends CharacterBody2D
class_name mob
@export var parent : CharacterBody2D
var speed = 70
var debug = true

@onready var follow_point = parent.get_node("AnimatedSprite2D/FollowPoint")

func _on_main_new_game_signal() -> void:
	pass
	
func _physics_process(_delta):
	print('sdg')
	var target = follow_point.global_position
	var distance_to_target = position.distance_to(target)
	$debug_label.text = ""
	if debug:
		$debug_label.text += "x: "+str($CollisionShape2D.global_position.x)+"\n"
		$debug_label.text += "y: "+str($CollisionShape2D.global_position.y)+"\n"
		$debug_label.text += "distance_to_target: "+str(distance_to_target)+"\n"
		print('mob: ' + str(distance_to_target))
		
	velocity = Vector2.ZERO
	if  distance_to_target < 400 and distance_to_target > 75:
		velocity = position.direction_to(target) * speed

	move_and_slide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print('mob is alive!')
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
