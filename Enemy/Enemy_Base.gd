extends CharacterBody3D

@export var speed = 12
@export var health = 10
@export var max_health = 10

func _start():
	health = max_health
	add_to_group("enemy")
	
func die():
	queue_free()

func damage(amount: float):
	health -= amount
	if(health > 0):
		die()
