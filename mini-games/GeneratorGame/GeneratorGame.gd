extends Control

@onready var won_label = get_node("%won")
@onready var fail_label = get_node("%fail")
@onready var instructions_label = get_node("%instructions")
@onready var nope_label = get_node("%nope")
@onready var timer = get_node("%fail_timer")
@onready var nope_timer = get_node("%nope_timer")

var over = false

var end: Callable = func(_n): return

func _ready():
	won_label.hide()
	fail_label.hide()
	nope_label.hide()

func _on_pull_cord_win():
	if ! over:
		instructions_label.hide()
		won_label.show()
		over = true
		end.call("win")

func _on_fail_timer_timeout():
	if ! over:
		instructions_label.hide()
		nope_label.hide()
		fail_label.show()
		over = true
		end.call("fail")

func _on_pull_cord_nope():
	if ! over:
		instructions_label.hide()
		nope_label.show()
		nope_timer.start()


func _on_nope_timer_timeout():
	nope_label.hide()
