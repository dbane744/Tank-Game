""" Splits tileset image into tiles """

extends Node

var tile_size = Vector2(128, 128)
onready var texture = $Sprite.texture

var tiles_to_extract = [Vector2(1728, 2328)]

func _ready():
	#var count = 0
	var id = 0
	
#	var ts = TileSet.new()
#	for tile in tiles_to_extract:
#
#		var region = Rect2(tile.x, tile.y,
#							tile_size.x, tile_size.y)
#		ts.create_tile(id)
#		ts.tile_set_texture(id, texture)
#		ts.tile_set_region(id, region)
#		id +=1
	
	
	var tex_width = texture.get_width() / tile_size.x
	var tex_height = texture.get_height() / tile_size.y
	var ts = TileSet.new()
	for x in range(tex_width):
		var count = 0
		if count < 20:
			for y in range(tex_height):

				var region = Rect2(x * tile_size.x, y * tile_size.y,
									tile_size.x, tile_size.y)
				#var id = x + y * 10
				id +=1
				if id == 279 or id == 280:
					ts.create_tile(id)
					ts.tile_set_texture(id, texture)
					ts.tile_set_region(id, region)

		else:
			break

		count+=1
			
	ResourceSaver.save("res://levels/terrain/objects_tilesheet.tres", ts)