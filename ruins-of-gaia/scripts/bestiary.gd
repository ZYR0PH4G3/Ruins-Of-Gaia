extends Node2D

# References to our visual nodes
@onready var monster_display: Sprite2D = $Sprite2D2
@onready var description_label: RichTextLabel = $RichTextLabel

# A Dictionary to hold all your monster data cleanly
var bestiary_data: Dictionary = {
	"Slime": {
		"texture": preload("res://scenes/enemy.tscn"), # Change to your sprite path
		"description": "[b]SLIME[/b]\n\nA squishy green puddle. Weak to fire, loves jumping around."
	},

}

func _ready() -> void:
	# Clear the screen text and image at the start
	description_label.text = "Select a monster to view its details."
	monster_display.texture = null
	
	# Automatically connect all monster buttons inside the container
	for button in $Area2D.get_children():
		if button is Area2D:
			button.input_event.connect(_on_monster_clicked.bind(button.name))

# This function runs whenever a monster's Area2D is clicked
func _on_monster_clicked(_viewport: Node, event: InputEvent, _shape_idx: int, monster_name: String) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if bestiary_data.has(monster_name):
			var data = bestiary_data[monster_name]
			monster_display.texture = data["texture"]
			description_label.text = data["description"]
		else:
			print("Error: No data found for " + monster_name)
