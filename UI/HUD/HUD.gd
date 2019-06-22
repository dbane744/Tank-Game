extends CanvasLayer

var bar_red = preload("res://assets/UI/barHorizontal_red_mid 200.png")
var bar_yellow = preload("res://assets/UI/barHorizontal_yellow_mid 200.png")
var bar_green = preload("res://assets/UI/barHorizontal_green_mid 200.png")
var bar_texture

func update_ammo(value):
	$Margin/VBoxContainer/Container/AmmoGauge.value = value
	
func update_health_bar(value):
	bar_texture = bar_green
	if value < 60:
		bar_texture = bar_yellow
	if value < 25:
		bar_texture = bar_red
	$Margin/VBoxContainer/Container/HealthBar.texture_progress = bar_texture
	
	$Margin/VBoxContainer/Container/HealthBar/Tween.interpolate_property($Margin/VBoxContainer/Container/HealthBar, 
			'value', $Margin/VBoxContainer/Container/HealthBar.value, value, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Margin/VBoxContainer/Container/HealthBar/Tween.start()
	$AnimationPlayer.play('health_bar_flash')

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'health_bar_flash':
		$Margin/VBoxContainer/Container/HealthBar.texture_progress = bar_texture

