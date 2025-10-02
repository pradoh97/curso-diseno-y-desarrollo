extends Node2D

@export_range(1, 9999, 1) var max_meteors_to_spawn : int = 1
@export_range(1, 9999, 1) var max_health_packs_to_spawn : int = 1

var meteor_scene := preload("res://flying_object/meteor/meteor.tscn")
var health_pack_scene := preload("res://flying_object/health_pack/health_pack.tscn")

func _ready() -> void:
	$Spaceship.health_bar = $UI/HealthBar
	$Spaceship.killed.connect(func():
		$MeteorTimer.stop()
		$HealthPackTimer.stop()
	)
	for star in $Stars.get_children():
		(star as CPUParticles2D).emitting = true

func spawn_flying_object(flying_object_scene : PackedScene):
	var flying_object : FlyingObject = flying_object_scene.instantiate()
	add_child(flying_object)

	flying_object.global_position = $SpawnPoints.get_children().pick_random().global_position

func _on_meteor_timer_timeout() -> void:
	$MeteorTimer.wait_time = randf_range(0.5, 1.2)
	for amount in randi_range(1, max_meteors_to_spawn):
		spawn_flying_object(meteor_scene)

func _on_health_pack_timer_timeout() -> void:
	$HealthPackTimer.wait_time = randf_range(1.2, 1.5)
	for amount in randi_range(1, max_health_packs_to_spawn):
		spawn_flying_object(health_pack_scene)
