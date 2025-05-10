extends CharacterBody2D

@export var floor_index: int = 0
@onready var door: CollisionShape2D = $Door

func _ready():
	var elevator = get_tree().get_first_node_in_group("elevator")
	if elevator:
		elevator.connect("floor_reached", Callable(self, "_on_elevator_arrived"))
		elevator.connect("floor_left", Callable(self, "_on_elevator_left"))
		if elevator.current_floor == floor_index:
			door.disabled = true
	else:
		push_error("Elevator not found!")

func _on_elevator_arrived(index):
	if index == floor_index:
		door.disabled = true
	else:
		door.disabled = false

func _on_elevator_left(index):
	if index == floor_index:
		door.disabled = false
