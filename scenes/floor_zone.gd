extends Area2D

func _on_floor_zone_body_entered(body):

	if not body.is_in_group("NPC"):
		return
