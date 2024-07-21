extends Control

@onready var won_label = get_node("%won")
@onready var fail_label = get_node("%fail")
@onready var instructions_label = get_node("%instructions")

var end: Callable = func(_n): return
var over = false
func _ready():
	won_label.hide()
	fail_label.hide()

func _on_timer_timeout():
	if ! over: 
		instructions_label.hide()
		fail_label.show()
		end.call("fail")
		over = true

func _on_plug_win():
	if ! over:
		instructions_label.hide()
		won_label.show()
		end.call("win")
		over = true
