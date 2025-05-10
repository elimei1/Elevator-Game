extends Node2D

var npc_scene = preload("res://scenes/NPC.tscn")
var floor_positions = [550, 350, 150]
@export var number_of_npc = 15

func _on_timer_timeout() -> void:
	if number_of_npc == 0:
		return
	
	if number_of_npc <= 1:
		get_node("Timer").stop()
	var npc = npc_scene.instantiate()
	
	var spawn_index = randi_range(0, floor_positions.size() - 1)
	var spawn_floor = floor_positions[spawn_index]
	npc.position = Vector2(1100, spawn_floor)

	var possible_targets = [0, 1, 2]
	possible_targets.erase(spawn_index)
	var target_floor_index = possible_targets.pick_random()
	
	npc.target_floor_index = target_floor_index
	npc.target_y = floor_positions[target_floor_index]
	
	add_child(npc)
	number_of_npc -= 1
