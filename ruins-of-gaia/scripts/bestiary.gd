extends CanvasLayer

@onready var slime_bestiary :Node2D = $Slime_Bestiary

func _on_area_2d_pressed() -> void:
	slime_bestiary.visible = true


func _on_button_pressed() -> void:
	slime_bestiary.visible = false
