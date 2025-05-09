extends CharacterBody2D

@export var speed: float = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Always walk left
	velocity.x = -speed

	# Simple gravity/floor logic
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	move_and_slide()
