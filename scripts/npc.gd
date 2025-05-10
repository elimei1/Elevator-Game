extends CharacterBody2D
class_name NPC

@export var speed: float = 150.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var in_elevator = false
var target_floor_index: int
var target_y: float

func _ready():
	var target_y_values = [550, 350, 150] 
	target_y = target_y_values[target_floor_index]  

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	
	if not in_elevator:
		velocity.x = -speed
	elif in_elevator:
		if abs(global_position.y - target_y) < 20.0:
			velocity.x = speed  

	move_and_slide()
