extends Control

@export var previous_scene_path: String = "res://scenes/MainMenu.tscn"


func _on_back_button_1_pressed() -> void:
	get_tree().change_scene_to_file(previous_scene_path)
