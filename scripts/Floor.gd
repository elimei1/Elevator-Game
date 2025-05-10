# Floor.gd
extends StaticBody2D

@export var floor_index: int = 0
@onready var door1 = get_tree().get_sec_node_in_group("doors") 

func _ready():
	door1.disabled = false
