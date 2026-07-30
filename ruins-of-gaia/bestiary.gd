extends Control

@onready var slime_label: Label = $Panel/ScrollContainer/VBoxContainer/Slimelabel

func _ready() -> void:
	# Update label visual state immediately
	update_bestiary_ui()

func update_bestiary_ui() -> void:
	if Global.bestiary["slime"] == true:
		slime_label.text = "🟢 SLIME\n\nA bouncy, harmless puddle of fluid. It feels squishy to the touch but contains a dangerous core."
	else:
		slime_label.text = "❓ UNKNOWN BEAST\n\nDefeat this creature out in the world to decipher its entry."

# Connect this to your Close/Back Button pressed signal
func _on_close_pressed() -> void:
	return_to_game()

# Connect this to your alternative close button if you have one
func _on_beastiary_closed_pressed() -> void:
	return_to_game()

func return_to_game():
	# Check where the player came from and pass them back safely
	if "world" in Global.current_scene:
		Global.current_scene = "bestiary" # Tell world.gd we are returning from book
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	elif "cliff" in Global.current_scene:
		Global.current_scene = "bestiary" # Tell cliff_side.gd we are returning from book
		get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
