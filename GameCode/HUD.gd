extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = ""
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
func update_score(score):
	$ScoreLabel.text = str(score)
func _on_start_button_pressed():
	$StartButton.hide()
	$Message.hide()
	$QuitButton.hide()
	get_tree().paused = false
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Message.text = "Ludam Dare 56 - Tiny Creatures"
	pass # Replace with function body.


func _on_big_guy_on_dead() -> void:
	$Message.text = "You defeated the big creature!"
	$Message.show()
	$QuitButton.show()
	$StartButton.show()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
