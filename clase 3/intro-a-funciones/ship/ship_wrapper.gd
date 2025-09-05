extends CharacterBody2D
class_name ShipWrapper

var velocidad

var arriba = Vector2(0, -1)
var abajo = Vector2(0, 1)
var derecha = Vector2(1, 0)
var izquierda = Vector2(-1, 0)
var direccion = Vector2.ZERO
var haciendo_movimiento = false
var motor_encendido = false

signal motor_se_apago

func _ready():
	set_process(false)
	ruta_de_la_nave()

func ruta_de_la_nave():
	pass

func _process(_delta):
	activar_propulsor()

func activar_propulsor():
	if not haciendo_movimiento and motor_encendido:
		velocity = velocidad*direccion
		haciendo_movimiento = true
	if haciendo_movimiento:
		velocity = velocity.lerp(Vector2.ZERO, 0.1)
		if velocity.length() <= 1:
			velocity = Vector2.ZERO
			haciendo_movimiento = false
			motor_encendido = false
			set_process(false)
			motor_se_apago.emit()

	if not velocity.is_zero_approx():
		move_and_slide()

func propulsar_nave(nueva_direccion):
	direccion = nueva_direccion
	motor_encendido = true
	set_process(true)
	await motor_se_apago
