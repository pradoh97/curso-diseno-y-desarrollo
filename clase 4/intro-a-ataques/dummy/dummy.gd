extends Area2D

func _on_body_entered(_body):
	$AnimationPlayer.stop()
	print("ouch!")
	$AnimationPlayer.play("hit")
