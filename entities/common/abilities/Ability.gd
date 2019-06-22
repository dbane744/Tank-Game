extends Node2D


onready var parent = get_parent()

func activate():
	pass
	
	
func destroy_ability():
	queue_free()