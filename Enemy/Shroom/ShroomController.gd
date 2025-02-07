extends "res://Enemy/Enemy_Base.gd"

@onready var target = get_node("../../Tree")

func _ready():
	speed = 4

func _physics_process(delta):
	var direction = target.position - global_position
	direction = direction.normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	move_and_slide()
