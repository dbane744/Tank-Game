extends Area2D

enum Items {speed_up}


export (Items) var type = Items.speed_up

var abilities = [preload("res://entities/common/abilities/SpeedUp.tscn")]


func _on_Pickup_body_entered(body):
	if 'ability' in body:
		match type:
			Items.speed_up:
				body.ability = abilities[type].instance()
	queue_free()