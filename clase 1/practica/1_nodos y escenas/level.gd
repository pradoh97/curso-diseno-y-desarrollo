extends Node2D

func _ready():
	$Camera2D.make_current()
	for coin in $Coins.get_children():
		coin.connect("collected", add_coin)

func add_coin():
	%Score.text = str(int(%Score.text) + 1)
