extends Node

var slow_terrain = [0, 10, 20, 30, 7, 8, 17, 18] # Tileset numbers in Ground
var current_level = 0
var levels = ["res://UI/TitleScreen.tscn", "res://UI/MainMenu.tscn", "res://levels/arena1/Arena1.tscn"]

func restart():
	current_level = 0
	get_tree().change_scene(levels[current_level])
	
func enter_main_menu():
	current_level = 1
	get_tree().change_scene(levels[current_level])

func next_level():
	current_level +=1
	if current_level < levels.size():
		get_tree().change_scene(levels[current_level])
	else:
		restart()