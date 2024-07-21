extends Node2D

var rng = RandomNumberGenerator.new()
@export var chance_out_of = 4

signal win
signal nope
@onready var timer = get_node("%retract_timer")

func _physics_process(_delta: float):  
	if ! timer.is_stopped(): return

	var stickVector = Input.get_vector( 
		"Crank_left","Crank_right",
		"Crank_up", "Crank_down"
	)
	
	if stickVector.length() >= 1 and Input.is_action_pressed("generator_throttle"):
		if rng.randi() % chance_out_of == 0:
			win.emit()
		else:
			nope.emit()
			timer.start()

