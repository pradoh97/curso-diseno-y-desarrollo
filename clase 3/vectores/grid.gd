extends Node2D

var spacing = 8

func _ready():
	$Line2D.visible = true
	for line in get_viewport_rect().size.x/spacing:
		var range = get_viewport_rect().size.x/2 - get_viewport_rect().size.x
		var instance := $Line2D.duplicate()
		var instance2 := $Line2D.duplicate()
		instance.global_position.x = range + line*spacing
		instance2.global_position.y = range + line*spacing
		(instance2 as Line2D).rotation_degrees = 90
		add_child(instance)
		add_child(instance2)
	$Line2D.queue_free()
