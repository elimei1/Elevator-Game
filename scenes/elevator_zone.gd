extends Area2D

func _on_elevator_zone_body_entered(body):
	if not body.is_in_group("NPC"):
		return
	body.in_zone = true
	
func _on_elevator_zone_body_exited(body):
	if not body.is_in_group("NPC"):
		return
	body.in_zone = false
