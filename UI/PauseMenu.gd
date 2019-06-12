extends CanvasLayer


func _input(event):
	if event.is_action_pressed('ui_pause'):
		if get_tree().paused == true:
			unpause()
		else:
			pause()
		
		
func _on_Continue_pressed():
	unpause()


func _on_Exit_pressed():
	get_tree().paused = false
	GLOBALS.restart()


func pause():
	get_tree().paused = true
	$MarginContainer.show()

func unpause():
	$MarginContainer.hide()
	get_tree().paused = false