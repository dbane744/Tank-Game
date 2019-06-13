extends CanvasLayer

func _input(event):
	if event.is_action_pressed("ui_select"):
		GLOBALS.restart()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'GameOver':
		$PlayMessage.visible = true
		$AnimationPlayer.play("PlayMessage")