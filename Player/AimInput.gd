extends Node3D
var camera
var plane
var world_pos

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	camera = get_viewport().get_camera_3d()
	plane = Plane(Vector3.UP, 0)
	

func _process(delta):
	
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_direction = camera.project_ray_normal(mouse_pos)
	world_pos = plane.intersects_ray(ray_origin, ray_direction)
	
	if world_pos != null:
		global_position = world_pos  # Move the sprite to world position
