extends Node
func _unhandled_input(event):
	if event.is_action_pressed("open_door"):
		$ElevatorDoor/CollisionShape2D.disabled = true
		print("Door opened!")
