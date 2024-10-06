extends Area2D

var speed = 750
var is_paused = false
func _physics_process(delta):
	if is_paused:
		return
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	print('pew')
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
