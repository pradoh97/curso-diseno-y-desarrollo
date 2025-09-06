class_name Trail
extends Line2D

@onready  var curve := Curve2D.new()

func _process(delta):
	curve.add_point(get_parent().position)

	points = curve.get_baked_points()
