extends Control



func _on_SinglePlayer_pressed():
	GLOBALS.next_level()


func _on_Exit_pressed():
	get_tree().quit()
