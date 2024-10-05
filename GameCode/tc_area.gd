extends CollisionShape2D

var tc_refs_in_area = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	
func _on_body_entered(other):
	print('thing entered area')
	tc_refs_in_area.add(other)

func _on_body_exited(other):
	if (tc_refs_in_area.has(other)):
		tc_refs_in_area.remove_at(tc_refs_in_area.find(other))
func get_refs_in_area():
	return tc_refs_in_area.size()
