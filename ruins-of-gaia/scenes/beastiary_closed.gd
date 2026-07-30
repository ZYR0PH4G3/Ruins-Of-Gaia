extends TextureButton


@export_file("res://scenes/bestiary.tscn") var bestiary_scene_path: String = "res://scenes/bestiary.tscn"




func _on_pressed() -> void:
	if bestiary_scene_path != "res://scenes/bestiary.tscn":
		get_tree().change_scene_to_file(bestiary_scene_path)
	else:
		print("Error: Bestiary scene path is empty!")
