extends SpaceshipWrapper

class_name Spaceship

#Hacer cambios a partir de acá.
@export var heal_damage_factor = 20
var health = 100.0

func collide_flying_object(flying_object : FlyingObject):
	if flying_object.deals_damage:
		health = health - heal_damage_factor
	else:
		health = health + heal_damage_factor
		if health > 100:
			health = 100
	
	health_bar.update(health)
	
	if health <= 0:
		$CollisionPolygon2D.set_deferred("disabled", true)
		kill_player()
