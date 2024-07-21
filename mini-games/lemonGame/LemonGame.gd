extends Control

@onready var won_label = get_node("%won")
@onready var fail_label = get_node("%fail")
@onready var instructions_label = get_node("%instructions")

var end: Callable = func(_n): return

func _ready():
	won_label.hide()
	fail_label.hide()
	
func _on_collision_shape_2d_fail():
	instructions_label.hide()
	fail_label.show()
	end.call("fail")


func _on_collision_shape_2d_win():
	instructions_label.hide()
	won_label.show()
	end.call("win")
