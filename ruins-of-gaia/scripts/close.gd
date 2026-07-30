extends Area2D

@export_file("*.tscn") var main_world_path: String = "res://scenes/world.tscn"

func _ready() -> void:
	self.input_event.connect(_on_back_clicked)

func _on_back_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().change_scene_to_file(main_world_path)
