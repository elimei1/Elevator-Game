extends Area2D

@export var floor_tolerance := 400
@export var elevator: CharacterBody2D 

func _on_floor_zone_body_entered(body):

	if not body.is_in_group("NPC"):
		return

	var y_diff = abs(body.position.y - elevator.position.y)
	print("npc ", body.position.y)
	print("elevator ", elevator.position.y)
	print(y_diff)
	
