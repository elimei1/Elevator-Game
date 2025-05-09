extends Area2D

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
