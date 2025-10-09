extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("izquierda"):
		$Sprite2D.flip_h = true
		velocity.x = -SPEED
	elif Input.is_action_pressed("derecha"):
		$Sprite2D.flip_h = false
		velocity.x =  SPEED
	else:
		$AnimationPlayer.play("idle")
		velocity.x = 0

	if velocity.x != 0:
		$AnimationPlayer.play("walk")

	move_and_slide()
