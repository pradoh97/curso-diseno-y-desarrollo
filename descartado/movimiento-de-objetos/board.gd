extends Node2D

var characters : Array[Character]

func _ready():
	characters.assign($Characters.get_children())
	for character in characters:
		character.mouse_entered.connect(func(): character.clickable = true)
		character.mouse_exited.connect(func(): character.clickable = false)
