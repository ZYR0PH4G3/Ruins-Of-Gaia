extends Node

var player_current_attack = false

var current_scene = "world" #world or cliff side or whatever
var transition_scene =  false

var player_exit_cliffside_posx = 199
var player_exit_cliffside_posy = 29
var player_start_posx = 34
var player_start_posy = 57
var game_first_loading = true

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"
