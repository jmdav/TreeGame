extends Node3D

@export var enemy_types = [preload("res://Enemy/Shroom/Shroom.tscn")]
@export var spawn_interval = 1
@export var spawn_radius = 80
@export var spawn_deadzone = 20

var timer: Timer

func random_location() -> Vector3:
	var location
	location = Vector3(
		sign(randf_range(-1.0, 1.0)) * randf_range(spawn_deadzone,spawn_radius),
		0,
		sign(randf_range(-1.0, 1.0)) * randf_range(spawn_deadzone,spawn_radius)
	)
	return location

func spawn_enemy():
	print("go my scarab")
	var new_spawn = enemy_types[0].instantiate()
	add_child(new_spawn)
	new_spawn.global_transform.origin = random_location()

func _ready():
	print("Go gog o")
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval  
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(spawn_enemy)
	timer.start()
