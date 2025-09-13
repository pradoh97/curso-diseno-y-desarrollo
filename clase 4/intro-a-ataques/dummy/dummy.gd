extends Area2D

var vulnerable : bool = true

func _on_body_entered(_body):
	if vulnerable:
		print("ouch!")
		vulnerable = false
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimationPlayer.play("hit")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hit":
		vulnerable = true
		$CollisionShape2D.set_deferred("disabled", false)
