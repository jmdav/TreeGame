extends CharacterBody3D

@export var speed = 12
@export var camera_offset = Vector3(0,26,8)

var camera_target
var player_camera_weight = 0.75

var bullet = preload("res://Weapon/bullet.tscn")

@onready var aim = get_node("Aim")
@onready var camera = get_viewport().get_camera_3d()

func set_camera_position():
	camera_target = (global_position * player_camera_weight) + (aim.global_position * (1 - player_camera_weight)) / 2
	camera.global_position = camera_target + camera_offset

func get_input():
	var direction = Vector3.ZERO
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	direction.x = input_direction.x
	direction.z = input_direction.y

	# Move in the camera's direction
	direction = direction.normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

	
	
func _input(event):
	if event.is_action_pressed(&"fire"):
		var newBullet = bullet.instantiate()
		newBullet.target = aim;
		newBullet.position = self.position
		get_tree().root.add_child(newBullet)
		
func _process(delta):
	set_camera_position()
