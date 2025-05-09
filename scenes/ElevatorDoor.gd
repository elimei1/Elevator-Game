extends StaticBody2D

@onready var door_shape = $CollisionShape2D

func _ready():
	set_process_input(true)
	print("ElevatorDoor ready – listening for input")

func _input(event):
	if event.is_action_pressed("open_door"):
		print("open_door fired!")
		door_shape.disabled = true
