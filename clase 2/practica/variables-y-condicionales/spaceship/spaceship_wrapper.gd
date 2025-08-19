extends CharacterBody2D

class_name SpaceshipWrapper

const SPEED = 800.0
var health_bar : HealthBar

signal killed

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func kill_player():
	killed.emit()
	set_physics_process(false)
	$AnimationPlayer.play("die")
	$AnimationPlayer.animation_finished.connect(get_tree().quit)
