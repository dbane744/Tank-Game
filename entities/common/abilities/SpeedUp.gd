extends "res://entities/common/abilities/Ability.gd"

export (Texture) var icon
export (String) var ability_name
export (int) var duration

var original_speed

func _ready():
	$Timer.wait_time = duration

func activate():
	
	var was_activated_successfully
	
	if 'max_speed' in parent:
		
		# Prevent speed up abilities from stacking
		if parent.is_sped_up:
			was_activated_successfully = false
		else:
			original_speed = parent.max_speed
			parent.max_speed *= 2
			parent.is_sped_up = true
			$Timer.start()
			was_activated_successfully = true
		
	return was_activated_successfully

func _on_Timer_timeout():
	parent.max_speed = original_speed
	parent.is_sped_up = false
	print('Destroying speed up')
	destroy_ability()
