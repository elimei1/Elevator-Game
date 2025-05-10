extends Area2D

@onready var npc: NPC = null
@onready var elevator = get_tree().get_current_scene().get_node("Elevator")
var layer = 2
var npc_queue: Array = []
var releasing = false

func _ready():
	if not elevator:
		push_error("Elevator not found!")
	set_process_input(true)

func _on_elevator_zone_body_entered(body):
	if body is NPC:
		body.in_elevator = true
		npc_queue.append(body)
		body.set_collision_layer_value(1, false)
		body.set_collision_layer_value(layer, true)
		body.set_meta("elevator_layer", layer)
		layer += 1

func _on_elevator_zone_body_exited(body):
	if body is NPC:
		body.in_elevator = false
		print(body.collision_mask)
