extends CharacterBody2D
class_name ShipWrapper

@export var draw_trail : bool = false

var velocidad
var arriba = Vector2(0, -1)
var abajo = Vector2(0, 1)
var derecha = Vector2(1, 0)
var izquierda = Vector2(-1, 0)
var direccion = Vector2.ZERO
var haciendo_movimiento = false
var motor_encendido = false
var destruida = false
var propulsando = false

signal motor_se_apago

func _ready():
	if not draw_trail:
		$Trail.process_mode = Node.PROCESS_MODE_DISABLED
		$Trail.visible = false
	else:
		$Trail.visible = true
	set_process(false)
	ruta_de_la_nave()

func ruta_de_la_nave():
	pass

func _process(_delta):
	activar_propulsor()

func activar_propulsor():
	if not haciendo_movimiento and motor_encendido:
		haciendo_movimiento = true
		velocity = velocidad*direccion.normalized()
	if haciendo_movimiento:
		velocity = velocity.lerp(Vector2.ZERO, 0.1)
		if velocity.length() <= 1:
			velocity = Vector2.ZERO
			haciendo_movimiento = false
			motor_encendido = false
			propulsando = false
			velocidad = 0
			direccion = Vector2.ZERO
			set_process(false)
			motor_se_apago.emit()

	if not velocity.is_zero_approx():
		move_and_slide()

func encender_motor():
	motor_encendido = true

func configurar_direccion(nueva_direccion):
	direccion = nueva_direccion

func propulsar_nave():
	if propulsando:
		destruida = true
		$AnimationPlayer.play("explode")
		$AnimationPlayer.animation_finished.connect(func(_animation): get_tree().quit())
	if not destruida:
		propulsando = true
		set_process(true)
		await motor_se_apago
