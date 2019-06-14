extends "res://entities/common/Bullets/Bullet.gd"

# Other bullets are areas
func _on_Bullet_area_entered(area):
	if area.has_method('explode'):
		area.explode()
		explode()