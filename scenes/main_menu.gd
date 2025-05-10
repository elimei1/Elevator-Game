extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")
	
func _on_help_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Help.tscn")
