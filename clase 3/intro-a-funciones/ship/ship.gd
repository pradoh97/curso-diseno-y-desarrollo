extends ShipWrapper

func ruta_de_la_nave():
	velocidad = 1000

	await propulsar_nave(arriba)
	await propulsar_nave(derecha)
