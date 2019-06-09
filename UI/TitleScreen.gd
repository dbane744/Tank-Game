extends Control



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'Title':
		$PlayMessage.visible = true
		$AnimationPlayer.play("PlayMessage")
