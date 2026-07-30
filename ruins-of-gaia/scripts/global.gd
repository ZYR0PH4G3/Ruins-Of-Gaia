extends Node

# Attack and Scene variables
var player_current_attack = false
var current_scene = "world"
var transition_scene = false
var game_first_loading = true

# Position Memory System (Remembers exactly where you stood before opening the book)
var saved_player_x = 0
var saved_player_y = 0

# Level Transition Coordinates
var player_exit_cliffside_posx = 199
var player_exit_cliffside_posy = 29
var player_start_posx = 34
var player_start_posy = 57

# Hollow Knight Journal Tracker
var bestiary = {
	"slime": false
}

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"

func unlock_monster(monster_name: String):
	if bestiary.has(monster_name):
		if bestiary[monster_name] == false:
			bestiary[monster_name] = true
			print(monster_name, " unlocked in the journal!")
