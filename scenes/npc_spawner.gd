extends Node2D

var npc_scene = preload("res://scenes/NPC.tscn")
var floor_positions = [80.0, 250.0]
@export var number_of_npc = 2

func _on_timer_timeout() -> void:
	if number_of_npc <= 1:
		get_node("Timer").stop()
	var npc = npc_scene.instantiate()
	var floor_y = floor_positions.pick_random()
	npc.position = Vector2(500, floor_y)
	add_child(npc)
	number_of_npc -= 1

	
