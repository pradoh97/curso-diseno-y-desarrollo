extends ShipWrapper
class_name Ship

func ruta_de_la_nave():
	velocidad = 1000

	configurar_direccion(arriba)
	encender_motor()
	await propulsar_nave()
	velocidad = 500
	configurar_direccion(derecha + arriba)
	encender_motor()
	await propulsar_nave()
	velocidad = 1000
	configurar_direccion(abajo + derecha/2)
	encender_motor()
	await propulsar_nave()
