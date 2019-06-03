extends Node2D

var bar_red = preload("res://assets/UI/barHorizontal_red_mid 200.png")
var bar_yellow = preload("res://assets/UI/barHorizontal_yellow_mid 200.png")
var bar_green = preload("res://assets/UI/barHorizontal_green_mid 200.png")


func _ready():
	for node in get_children():
		node.hide()
		
func _process(delta):
	global_rotation = 0

func update_health_bar(value):
	$Health_bar.texture_progress = bar_green
	if value < 60:
		$Health_bar.texture_progress = bar_yellow
	if value < 25:
		$Health_bar.texture_progress = bar_red
	if value < 100:
		$Health_bar.show()
	$Health_bar.value = value
	