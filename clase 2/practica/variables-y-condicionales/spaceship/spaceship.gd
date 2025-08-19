extends CharacterBody2D

class_name Spaceship

const SPEED = 800.0
var health = 100.0
var health_bar : HealthBar

signal killed

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func collide_flying_object(flying_object : FlyingObject):
	if flying_object.deals_damage:
		health = health - 20
	else:
		health = health + 20
	health_bar.update(health)
	if health <= 0:
		kill_player()
	
func kill_player():
	killed.emit()
	set_physics_process(false)
	$AnimationPlayer.play("die")
	$AnimationPlayer.animation_finished.connect(get_tree().quit)
