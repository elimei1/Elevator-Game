extends CharacterBody2D

@export var speed: float = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_move = true

func _physics_process(delta):
	if can_move:
		velocity.x = -speed
	else:
		velocity.x = 0

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0 

	move_and_slide()
