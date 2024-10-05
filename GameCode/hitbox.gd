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
		self.global_position
		print("Mouse Click/Unclick at: ", event.position)
