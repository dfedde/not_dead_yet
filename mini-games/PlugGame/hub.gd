extends HBoxContainer



@export var buttons: Array[ButtonMapping]


func _ready():
	buttons.shuffle()
	for i in 1:
		var button_mapping = buttons[i]
		var button_node_name = "%" + ("button%d" % (i+1) )
		print(button_node_name)
		var node = get_node(button_node_name)
		node.textrue = button_mapping.image.to_image()
