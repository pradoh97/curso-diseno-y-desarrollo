extends PanelContainer

var max_health
var health_factor = 5

func _ready():
	max_health = size.x
	$CurrentHealth.texture.width = max_health

func decrease():
	var new_health = max_health/health_factor
	$CurrentHealth.texture.width = clamp($CurrentHealth.texture.width - new_health, 1, INF)
	if $CurrentHealth.texture.width < 10:
		get_tree().quit(0)

func increase():
	var new_health = max_health/health_factor
	$CurrentHealth.texture.width = clamp($CurrentHealth.texture.width + new_health, 1, INF)
