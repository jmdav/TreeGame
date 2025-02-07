extends RigidBody3D

@export var max_lifetime = 1
@export var speed = 30
@export var damage = 1

var lifetime = 0
var target

func _ready():
	var direction = (target.global_position - global_transform.origin).normalized()
	linear_velocity = direction * speed
	connect("body_entered", bullet_collide)

func _physics_process(delta):
	lifetime += delta
	if(lifetime > max_lifetime):
		queue_free()

func bullet_collide(body: PhysicsBody3D):
	if(body.is_in_group("enemy")):
		body.damage(damage)
		queue_free()
