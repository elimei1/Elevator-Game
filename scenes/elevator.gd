extends CharacterBody2D

const SPEED = 100.0
var target_y: float = 170.0 

func _physics_process(delta):
	var direction = sign(target_y - global_position.y)
	if abs(target_y - global_position.y) > 2.0:
		velocity.y = direction * SPEED
		move_and_slide()
	else:
		global_position.y = target_y
		velocity.y = 0.0

func _input(event):
	if event.is_action_pressed("elevator_up"):
		target_y -= 157.0
	elif event.is_action_pressed("elevator_down"):
		target_y += 157.0
