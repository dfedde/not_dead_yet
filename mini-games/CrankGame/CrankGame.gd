extends Control

@onready var won_label = get_node("%won")
@onready var fail_label = get_node("%fail")
@onready var instructions_label = get_node("%instructions")
@onready var timer_label = get_node("%timer")
@onready var timer = get_node("%fail_timer")

var over = false

var end: Callable = func(_n): return

func _process(_delta):
	timer_label.text = "%2d" % (timer.time_left * 10)
	
func _ready():
	won_label.hide()
	fail_label.hide()
	
func _on_timer_timeout():
	if ! over:
		instructions_label.hide()
		fail_label.show()
		over = true
		end.call("fail")
		

func _on_crank_arm_win():
	if ! over:
		instructions_label.hide()
		won_label.show()
		over = true
		end.call("win")
