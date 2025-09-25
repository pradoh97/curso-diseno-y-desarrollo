extends CharacterBody2D
class_name Player

#Abajo de esta linea creá tu variable de salto

#Dejá lo que sigue sin cambiar
@export_category("Player stats")
@export_range(0, 10000, 10) var speed = 300.0
var gravity = 980.0
var invert = -1
var default_speed = 300
var jumped = false

func _ready():
	$AnimatedSprite2D.speed_scale = speed / default_speed

func _physics_process(delta):
	if not is_on_floor():
		velocity += Vector2(0, gravity) * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumped = true
		#Abajo de esta linea modificá la cuenta para que se use la velocidad que definiste
		velocity.y = 0
		#Dejá lo que sigue sin cambiar

	if jumped:
		velocity.y *= invert
		jumped = false
	var direction = Input.get_axis("left", "right")
	if direction:
		$AnimatedSprite2D.play("default")
		velocity.x = direction * speed
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.stop()
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
