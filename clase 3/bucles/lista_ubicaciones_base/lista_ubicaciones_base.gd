extends VBoxContainer
class_name ListaUbicacionesBase

func agregar_ubicacion(nombre : String = ""):
	var escena_ubicacion : PackedScene = load("res://ubicacion/ubicacion.tscn")
	var instancia : Ubicacion = escena_ubicacion.instantiate()
	instancia.asignar_nombre(nombre)
	add_child(instancia)
