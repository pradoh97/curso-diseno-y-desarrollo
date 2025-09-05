extends StaticBody2D
class_name Character

var clickable : bool = false
var spaces_to_move = 10

func _input(event):
	if clickable and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var direction = Vector2([-1, 1].pick_random(),[-1, 1].pick_random())
			position += direction * spaces_to_move
