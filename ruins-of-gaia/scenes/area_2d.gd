extends Area2D

@export_file("res://scenes/bestiary.tscn") var bestiary_scene_path: String = "res://scenes/bestiary.tscn"
@onready var bestiary_menu: CanvasLayer = $BestiarySelection

func _ready() -> void:
	self.input_event.connect(_on_input_event)

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Make the hidden bestiary menu overlay pop up on screen
		bestiary_menu.visible = true
		
		# Force all monster slots inside the bestiary to update their graphics instantly
		# This ensures they read the latest true/false values from your Global script
		for slot in bestiary_menu.get_children():
			if slot.has_method("update_visuals"):
				slot.update_visuals()


func _on_button_pressed() -> void:
	bestiary_menu.visible = false
