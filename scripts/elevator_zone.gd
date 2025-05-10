extends Area2D

@onready var npc: NPC = null
@onready var elevator = get_tree().get_current_scene().get_node("Elevator")

func _ready():
	if not elevator:
		push_error("Elevator not found!")
	set_process_input(true)

func _on_elevator_zone_body_entered(body):
	if body is NPC:
		npc = body
		npc.in_elevator = true

func _on_elevator_zone_body_exited(body):
	if body is NPC:
		body.in_elevator = false

func _input(event):
	if event.is_action_pressed("elevator_open") and npc:
		
		for floor in get_tree().get_nodes_in_group("floors"):
			if abs(floor.global_position.y - elevator.global_position.y) < 2.0:
				var col = floor.get_node("CollisionShape2D")
				col.disabled = true
				break
				
	if event.is_action_pressed("npc_out"): 
		npc.velocity.x = 100
