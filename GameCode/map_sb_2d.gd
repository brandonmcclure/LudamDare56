extends StaticBody2D

@onready var map_collision = $map_collision
@onready var map_polygon = $map_collision/map_polygon
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	map_polygon.polygon = map_collision.polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
