extends Node2D

@export var npc_scene: PackedScene
@export var floor_positions := [80.0, 250.0]
@export var spawn_x: float = 500.0
var number_of_npc = 1

func _ready():
	spawn_npc()

func spawn_npc():
	for i in range(number_of_npc):
		var floor_y = floor_positions.pick_random()
		var npc := npc_scene.instantiate() as NPC
		npc.global_position = Vector2(spawn_x, floor_y)
		add_child(npc)
		_on_timer_timeout()
	

func _on_timer_timeout() -> void:
	number_of_npc -= 1
	spawn_npc()
