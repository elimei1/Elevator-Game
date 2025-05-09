extends Area2D

@onready var npc = null
@onready var elevator = null

func _ready():
	elevator = get_node("Elevator")
	if elevator == null:
		push_error("Elevator not found!")

func _on_elevator_zone_body_entered(body):
	if body.name == "NPC": 
		npc = body
		npc.can_move = false

func _on_elevator_zone_body_exited(body):
	if body.name == "NPC":
		if abs(elevator.global_position.y - npc.global_position.y) < 2.0:
			npc.can_move = true
