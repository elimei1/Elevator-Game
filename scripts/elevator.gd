# Elevator.gd
extends CharacterBody2D
class_name ELEVATOR

var floor_positions = Global.floor_positions
signal floor_reached(floor_index: int)
signal floor_left(index: int)
@export var speed: float = 200.0
const ELEV_UP     := "elevator_up"
const ELEV_DOWN   := "elevator_down"

var current_floor: int = 0
var target_floor: int = 0

func _ready():
	global_position.y = floor_positions[current_floor]
	set_process_input(true)

func _input(event):
	if event.is_action_pressed(ELEV_UP) and current_floor == target_floor:
		if target_floor < floor_positions.size() - 1:
			target_floor += 1
			emit_signal("floor_left", current_floor)
		return

	if event.is_action_pressed(ELEV_DOWN) and current_floor == target_floor:
		if target_floor > 0:
			target_floor -= 1
			emit_signal("floor_left", current_floor)
		return

func _physics_process(delta):
	var ty = floor_positions[target_floor]
	var dy = ty - global_position.y

	if abs(dy) > 1.0:
		velocity.y = sign(dy) * speed
	else:
		velocity.y = 0
		
	
	move_and_slide()

	if abs(dy) <= 1.0 and current_floor != target_floor:
		current_floor = target_floor
		emit_signal("floor_reached", current_floor)
