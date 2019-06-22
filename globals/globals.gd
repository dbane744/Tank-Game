extends Node

#var slow_terrain = [0, 10, 20, 30, 7, 8, 17, 18] # Tileset numbers in Ground
#const terrain_tile_numbers = {GRASS = [0, 10, 20, 30, 7, 8, 17, 18]}
const terrain_tiles = {GRASS = [0, 7, 8, 10, 17, 18],
						SAND = [20, 30]}
						
const terrain_modifiers = {GRASS = 0.9,
							SAND = 0.6}
						
					

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