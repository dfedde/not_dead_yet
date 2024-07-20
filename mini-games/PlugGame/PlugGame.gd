extends Control

@onready var won_label = get_node("%won")
@onready var fail_label = get_node("%fail")
@onready var instructions_label = get_node("%instructions")
@onready var timer_label = get_node("%timer")
@onready var nope_label = get_node("%nope")
@onready var timer = get_node("%fail_timer")
@onready var nope_timer = get_node("%nope_timer")

var over = false

func _process(_delta):
	timer_label.text = "%2d" % (timer.time_left * 10)
	
func _ready():
	won_label.hide()
	fail_label.hide()
	nope_label.hide()
	
func _on_fail_timer_timeout():
	if ! over:
		instructions_label.hide()
		fail_label.show()
		over = true

func _on_hub_2_win():
	if ! over:
		instructions_label.hide()
		won_label.show()
		over = true


func _on_hub_2_nope():
	if ! over:
		instructions_label.hide()
		nope_label.show()
		nope_timer.start()


func _on_nope_timer_timeout():
	nope_label.hide()
