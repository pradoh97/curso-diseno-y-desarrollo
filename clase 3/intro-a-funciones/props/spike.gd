extends Area2D

func _on_body_entered(body):
	(body as Ship).destruida = true
	(body as Ship).velocity = Vector2.ZERO
	var tween = create_tween()
	tween.tween_property(body, "scale", Vector2.ZERO, 1)
	tween.finished.connect(func(): get_tree().call_deferred("change_scene_to_file", get_tree().current_scene.scene_file_path))
