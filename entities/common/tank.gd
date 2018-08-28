extends KinematicBody2D

signal health_changed
signal dead

export (int) var speed
export (float) var tank_rotation_speed
export (float) var gun_cooldown
export (int) var health

var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	$GunTimer.wait_time = gun_cooldown

func control(delta):
	pass


func _physics_process(delta):
	if not alive:
		return
		
	control(delta)
	move_and_slide(velocity)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
