# Elevator.gd
extends CharacterBody2D

@export var floor_positions: Array[float] = [98.0, 49.0]

@export var speed: float = 100.0

# Input actions (make sure you’ve bound these in InputMap)
const OPEN_DOOR   := "open_door"
const ELEV_UP     := "elevator_up"
const ELEV_DOWN   := "elevator_down"

# The door’s CollisionShape2D (must be a direct child named “DoorShape”)
@onready var door_shape: CollisionShape2D = $ElevatorDoor

# Track where we are vs. where we want to go
var current_floor: int = 0
var target_floor: int = 0

signal floor_reached(floor_index: int)

func _ready():
	# Snap to initial floor
	global_position.y = floor_positions[current_floor]
	set_process_input(true)

func _input(event):
	# 1) Open door if stopped at a floor
	if event.is_action_pressed(OPEN_DOOR) and current_floor == target_floor:
		door_shape.disabled = true
		return

	# 2) Queue movement up
	if event.is_action_pressed(ELEV_UP) and current_floor == target_floor:
		if target_floor < floor_positions.size() - 1:
			# close the door before moving
			door_shape.disabled = false
			target_floor += 1
		return

	# 3) Queue movement down
	if event.is_action_pressed(ELEV_DOWN) and current_floor == target_floor:
		if target_floor > 0:
			door_shape.disabled = false
			target_floor -= 1
		return

func _physics_process(delta):
	var ty = floor_positions[target_floor]
	var dy = ty - global_position.y

	if abs(dy) > 1.0:
		# Move toward the target floor
		velocity.y = sign(dy) * speed
		move_and_slide()
	else:
		# Arrived (or already there)
		velocity = Vector2.ZERO
		global_position.y = ty

		if current_floor != target_floor:
			current_floor = target_floor
			emit_signal("floor_reached", current_floor)
			# Re-enable the door once we’ve stopped
			door_shape.disabled = false
