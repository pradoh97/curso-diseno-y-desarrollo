extends Node2D

func _ready():
	for coin in $Coins.get_children():
		coin.connect("body_entered", add_coin)
		coin.connect("body_entered", func(_body): coin.queue_free())

func add_coin(_body):
	%Score.text = str(int(%Score.text) + 1)
