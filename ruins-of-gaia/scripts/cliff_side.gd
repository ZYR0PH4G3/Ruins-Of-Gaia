extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_scene = "cliff_side"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	changescenes()




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false

func changescenes():
	if Global.transition_scene == true:
		if Global.current_scene == "cliff_side":
			Global.transition_scene = false
			get_tree().change_scene_to_file("res://scenes/world.tscn")
