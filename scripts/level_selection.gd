extends Control


func _on_level1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level.tscn")
	
func _on_level2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	
func _on_level3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level3.tscn")
