extends Area2D

# Make sure this matches your exact file path
@export_file("res://scenes/bestiary.tscn") var bestiary_scene_path: String = "res://scenes/bestiary.tscn"

func _ready() -> void:
	# Connects the built-in input signal to our function automatically
	self.input_event.connect(_on_input_event)

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# Checks if the player left-clicked the mouse inside the collision shape
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if bestiary_scene_path != "":
			get_tree().change_scene_to_file(bestiary_scene_path)
		else:
			print("Error: Bestiary scene path is empty!")
