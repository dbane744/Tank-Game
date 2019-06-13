extends Node2D

var game_over = preload("res://UI/GameOver.tscn").instance()

func _ready():
	set_camera_limits()
	Input.set_custom_mouse_cursor(load("res://assets/UI/crossair_black.png"), Input.CURSOR_ARROW, Vector2(16,16))
	$Player.map = $Ground
	
func set_camera_limits():
	var map_limits = $Ground.get_used_rect()
	var map_cellsize = $Ground.cell_size
	$Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$Camera2D.target_mode = 'target_node'
	$Camera2D.target_node = $Player
	
func _on_Tank_shoot(bullet, _position, _direction, _target=null):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction, _target)
	

func _on_Player_dead():
	add_child(game_over)
	#add_child_below_node($Camera2D, game_over)
	

