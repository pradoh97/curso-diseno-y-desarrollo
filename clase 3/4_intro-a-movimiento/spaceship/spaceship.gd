extends CharacterBody2D
class_name Spaceship

@export var heal_damage_factor = 20
var health = 100.0
var health_bar : HealthBar

signal killed

func kill_player():
	killed.emit()
	set_physics_process(false)
	$AnimationPlayer.play("die")
	$AnimationPlayer.animation_finished.connect(get_tree().quit)

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
