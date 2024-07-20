extends HBoxContainer


@export var buttons: Array[ButtonMapping]

var rng = RandomNumberGenerator.new()
var inputs: Array[String]
var over = false
var working_input: String
signal nope
signal win

func load_buttons():
	for file_name in DirAccess.get_files_at("res://mini-games/PlugGame/assets/Mappings"):
		file_name = "res://mini-games/PlugGame/assets/Mappings/" + file_name
		var file = ResourceLoader.load(file_name)
		buttons.append(file)

func _ready():
	load_buttons()
	buttons.shuffle()
	for i in 5:
		var button_mapping = buttons[i]
		var button_node_name = "%" + ("button%d" % (i+1) )
		var node = get_node(button_node_name)
		node.texture = button_mapping.image
		inputs.append(button_mapping.action)
	working_input = inputs[rng.randi_range(0,inputs.size()-1)]

func _input(_event):
	if over: return

	if Input.is_action_just_pressed(working_input):
		win.emit()
		return

	for input in inputs:
		if Input.is_action_just_pressed(input):
			nope.emit()
