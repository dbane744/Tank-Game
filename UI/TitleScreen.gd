extends Control


func _input(event):
	if event.is_action_pressed("ui_select"):
		GLOBALS.next_level()
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'Title':
		$PlayMessage.visible = true
		$AnimationPlayer.play("PlayMessage")
