extends CharacterBody2D

const SPEED = 100.0
var target_y: float = 170.0  # The target Y position where the elevator should go
var is_moving: bool = false  # To track whether the elevator is moving

func _physics_process(delta):
	var direction = sign(target_y - global_position.y)

	# If the elevator is not at the target, move it
	if abs(target_y - global_position.y) > 2.0:
		velocity.y = direction * SPEED
		is_moving = true
	else:
		# Stop the elevator when it reaches the target position
		global_position.y = target_y
		velocity.y = 0.0
		is_moving = false

	# Apply the movement to the elevator
	move_and_slide()

func _input(event):
	# Change the target Y position based on user input
	if event.is_action_pressed("elevator_up"):
		target_y -= 157.0  # Move up by 157 units
	elif event.is_action_pressed("elevator_down"):
		target_y += 157.0  # Move down by 157 units
