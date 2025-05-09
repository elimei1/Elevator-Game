extends Area2D


@onready var npc: NPC = null
@onready var elevator: Node2D = null

func _ready():
	elevator = get_node("Elevator")
	if not elevator:
		push_error("Elevator not found!")
	set_process_input(true)

func _on_elevator_zone_body_entered(body):
	if body is NPC:
		npc = body
		# freeze it at the door
		npc.can_move = false

func _on_elevator_zone_body_exited(body):
	if body is NPC:
		npc = null

func _input(event):
	if event.is_action_pressed("elevator_open") and npc:
		# 1) Find the Floor instance at the elevator’s current Y
		for floor in get_tree().get_nodes_in_group("floors"):
			if abs(floor.global_position.y - elevator.global_position.y) < 2.0:
				# 2) Disable its collider so the NPC can enter
				var col = floor.get_node("CollisionShape2D")
				col.disabled = true
				break

		# 3) Reparent the NPC under the elevator so it rides with it
		var world_pos = npc.global_position
		get_parent().remove_child(npc)
		elevator.add_child(npc)
		npc.global_position = world_pos

var npcs_on_floor: Array = []

func _on_elevator_zone_body_entered(body):
	if not body.is_in_group("NPC"):
		return
	body.in_zone = true
	npcs_on_floor.append(body)
	body.queue_free()
	
func _on_elevator_zone_body_exited(body):
	if not body.is_in_group("NPC"):
		return
	body.in_zone = false

