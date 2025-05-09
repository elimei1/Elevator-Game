extends Area2D

@onready var npc = null

func _on_elevator_zone_body_entered(body):
	if body is NPC: 
		npc = body
		npc.can_move = false

func _on_elevator_zone_body_exited(body):
	if body is NPC:
		body.can_move = true
