extends KinematicBody2D

signal shoot
signal health_changed
signal ammo_changed
signal dead

export (PackedScene) var Bullet
export (int) var max_speed
export (float) var tank_rotation_speed
export (float) var gun_cooldown
export (int) var max_health
export (float) var offroad_friction

export (int) var gun_shots = 1
export (float, 0, 0.15) var gun_spread = 0.2
export (int) var max_ammo = 20
export (int) var ammo = -1 setget set_ammo #-1 is infinite ammo

var velocity = Vector2()
var can_shoot = true
var alive = true
var health
var map

func _ready():
	health = max_health
	$Smoke.emitting = false
	emit_signal('health_changed', health * 100/max_health)
	emit_signal('ammo_changed', ammo * 100/max_ammo)
	$GunTimer.wait_time = gun_cooldown

func control(delta):
	pass

func shoot(num, spread, target=null):
	if can_shoot and self.ammo != 0: #will only call setget function if using self.
		self.ammo -= 1
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1,0).rotated($Turret.global_rotation)
		if num > 1:
			for i in range(num):
				# The bullets will be spread between the negative spread value and the positive spread value 
				# (negative spread + (positive spread * 2))
				# By dividing the positive spread to add to subsequent bullets by (num-1), the bullets will be spread in the possible angle
				var a = -spread + i * (2*spread)/(num-1)
				emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir.rotated(a), target)
		else:
			emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir, target)
		$AnimationPlayer.play("muzzle_flash")

func _physics_process(delta):
	if not alive:
		return
		
	control(delta)
	if map:
		var tile = map.get_cellv(map.world_to_map(position))
		
		if tile in GLOBALS.terrain_tiles.GRASS:
			offroad_friction = GLOBALS.terrain_modifiers.GRASS
			velocity *= offroad_friction
		elif tile in GLOBALS.terrain_tiles.SAND:
			offroad_friction = GLOBALS.terrain_modifiers.SAND
			velocity *= offroad_friction
		
	move_and_slide(velocity)
	
	
func take_damage(amount):
	health -= amount
	if health < max_health / 2:
		$Smoke.emitting = true
	emit_signal('health_changed', health * 100/max_health)
	if health <= 0:
		explode()
	
func heal(amount):
	health += amount
	health = clamp(health, 0, max_health)
	emit_signal('health_changed', health * 100/max_health)
	if health >= max_health / 2:
		$Smoke.emitting = false
	
func explode():
	$CollisionShape2D.set_deferred('disabled', true) # Must defer because collision shapes cann't be disabled while physics is processing
	alive = false
	$Turret.hide()
	$Body.hide()
	$Smoke.emitting = false
	$Explosion.show()
	$Explosion.play()
	emit_signal("dead")
	

func set_ammo(value):
	if value > max_ammo:
		value = max_ammo
	ammo = value
	emit_signal('ammo_changed', ammo * 100/max_ammo)

func _on_GunTimer_timeout():
	can_shoot = true


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Explosion_animation_finished():
	queue_free()
