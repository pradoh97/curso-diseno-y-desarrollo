extends SpaceshipWrapper

class_name Spaceship

#Hacer cambios a partir de acá.
var health = 100.0

func collide_flying_object(flying_object : FlyingObject):
	if flying_object.deals_damage:
		health = health - 20
		kill_player()
	else:
		health = health + 20
	
	health_bar.update(health)
