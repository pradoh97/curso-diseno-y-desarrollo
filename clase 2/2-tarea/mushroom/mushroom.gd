extends Area2D


func _on_body_entered(body):
	if body is CharacterBody2D:
		body.jump_velocity *= 2
		body.speed *= 1.25
		body.gravity *= 1.25
		body.scale *= 1.15
		queue_free()
