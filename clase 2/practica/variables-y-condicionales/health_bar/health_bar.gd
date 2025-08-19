extends PanelContainer

class_name HealthBar

var max_health
var health_factor = 5

func _ready():
	max_health = size.x
	$CurrentHealth.texture.width = max_health

func update(new_health : float):
	var current_health_percent = new_health/100.0
	$CurrentHealth.texture.width = clamp(max_health*current_health_percent, 1, INF)
