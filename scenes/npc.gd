class_name NPC
extends CharacterBody2D

var in_zone = false
var go_back = false
@export var speed: float = 150.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	add_to_group("NPC")

func _input(event):
	if event.is_action_pressed("go_back"):
		go_back = true

func _physics_process(delta):
	if in_zone and not go_back:
		velocity.x = 0
	else:
		velocity.x = speed if go_back else -speed

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0 

	move_and_slide()
