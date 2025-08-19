extends PanelContainer

class_name HealthBar

var max_health
var warning_health = 60
var critical_health = 40

func _ready():
	max_health = size.x
	$CurrentHealth.texture.width = max_health

func update(new_health : float):
	var current_health_percent = new_health/100.0
	
	#Hacer cambios a partir de acá.
	$CurrentHealth.texture.width = clamp(max_health*current_health_percent, 1, INF)
		
	if new_health < critical_health:
		$CurrentHealth.texture.gradient.colors[0] = Color("#f60028")
	elif new_health < warning_health:
		$CurrentHealth.texture.gradient.colors[0] = Color("#ab7a19")
	else:
		$CurrentHealth.texture.gradient.colors[0] = Color("#609543")
