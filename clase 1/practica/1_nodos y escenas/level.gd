extends Node2D

func _ready():
	$Camera2D.make_current()
	for coin in $Coins.get_children():
<<<<<<< HEAD
		coin.connect("body_entered", add_coin)
		coin.connect("body_entered", func(_body): coin.queue_free())

func add_coin(_body):
=======
		coin.connect("collected", add_coin)

func add_coin():
>>>>>>> branch 'master' of git@github.com:pradoh97/curso-diseno-y-desarrollo.git
	%Score.text = str(int(%Score.text) + 1)
