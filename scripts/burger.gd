extends TextureButton

@export var previous_scene_path: String = "res://scenes/MainMenu.tscn"


func _on_burger_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
