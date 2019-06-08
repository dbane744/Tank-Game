extends "res://entities/common/tank.gd"

var rotation_dir = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func control(delta):
	$Turret.look_at(get_global_mouse_position())
	
	
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		rotation_dir += 1
	if Input.is_action_pressed('left'):
		rotation_dir -= 1
		
	rotation += rotation_dir * tank_rotation_speed * delta
		
	if Input.is_action_pressed('down'):
		velocity = Vector2(-max_speed/2, 0).rotated(rotation)
	if Input.is_action_pressed('up'):
		velocity = Vector2(max_speed, 0).rotated(rotation)
	
	if Input.is_action_pressed('left_click'):
		shoot(gun_shots, gun_spread)