extends PanelContainer

var total_width

func _ready():
	total_width = size.x
	$CurrentHealth.texture.width = total_width

func decrease():
	$CurrentHealth.texture.width = clamp($CurrentHealth.texture.width - total_width/10, 1, INF)

func increase():
	$CurrentHealth.texture.width = clamp($CurrentHealth.texture.width + total_width/10, 1, INF)
