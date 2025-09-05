extends HBoxContainer
class_name Ubicacion

func asignar_nombre(nombre : String = ""):
	if nombre == "":
		nombre = "<Ubicación sin nombre>"
	$Nombre.text = nombre
