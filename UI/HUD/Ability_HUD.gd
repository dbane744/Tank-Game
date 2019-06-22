extends Control

var no_ability_icon


func _ready():
	no_ability_icon = $MarginContainer/VBoxContainer/AbilityIcon.texture
	
	
func reset_icon():
	$MarginContainer/VBoxContainer/AbilityIcon.texture = no_ability_icon