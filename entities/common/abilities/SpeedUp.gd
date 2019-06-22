extends "res://entities/common/abilities/Ability.gd"

export (Texture) var icon
export (int) var duration

var original_speed

func _ready():
	$Timer.wait_time = duration

func activate():
	if 'max_speed' in parent:
		print(parent.max_speed)
		original_speed = parent.max_speed
		parent.max_speed *= 2
		$Timer.start()

func _on_Timer_timeout():
	parent.max_speed = original_speed
	print('Destroying speed up')
	destroy_ability()
