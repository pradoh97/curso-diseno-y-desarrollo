extends Area2D
class_name FlyingObject

@export var deals_damage : bool = true
@export var max_speed = 1000
@export var min_speed = 800
var direction : Vector2
var speed

func _on_body_entered(body: Node2D) -> void:
	(body as Spaceship).collide_flying_object(self)
	queue_free()

func _ready():
	var horizontal_direction = [-1, 1].pick_random()
	var vertical_direction = 1
	direction = Vector2(horizontal_direction, vertical_direction)
	speed = Vector2(randf_range(25, 100), randf_range(min_speed, max_speed))

func _process(delta: float) -> void:
	global_position += Vector2(direction.x*speed.x*delta, direction.y*speed.y*delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
