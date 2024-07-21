extends Control

@onready var viewport = get_node("GridContainer/SubViewportContainer/SubViewport")

var games: Array[PackedScene] = [
	load("res://mini-games/lemonGame/LemonGame.tscn"),
	load("res://mini-games/CrankGame/CrankGame.tscn"),
	load("res://mini-games/GeneratorGame/GeneratorGame.tscn"),
	load("res://mini-games/PlugGame/PlugGame.tscn"),
	load("res://mini-games/SnakeGame/SnakeGame.tscn")
]
var last_outcome = ""
func load_game():
	games.shuffle()
	var game = games[0]
	var game_node = game.instantiate()
	game_node.end = func (outcome): last_outcome = outcome; load_game()
	clean_viewport()
	viewport.add_child(game_node)

func clean_viewport():
	for n in viewport.get_children():
		viewport.remove_child(n)
		n.queue_free()
		
func _ready():
	load_game()
