extends CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _input_event(_viewport: Object, event: InputEvent, _shape_idx: int) -> void:
	print('in this guy')
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Mouse Click/Unclick at: ", event.position)
