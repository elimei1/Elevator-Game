class_name NPC
extends CharacterBody2D

@export var speed: float = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_move = true
var npc_floor_y: float

@onready var elevator = null

func _ready():
	npc_floor_y = global_position.y 
	elevator = get_node("Elevator")
	if elevator:
		elevator.connect("floor_reached", Callable(self, "_on_elevator_floor_reached"))

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
