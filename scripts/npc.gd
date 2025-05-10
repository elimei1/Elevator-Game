extends CharacterBody2D
class_name NPC

@export var speed: float = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var in_elevator = false

func _physics_process(delta):
	if not in_elevator:
		velocity.x = -speed

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	move_and_slide()
