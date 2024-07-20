extends Node2D

var lastAngle:float = 0      
var totalRotation: float  

signal win

func _ready():
	pass

func _physics_process(_delta: float):  

	var stickVector = Input.get_vector( 
		"Crank_left","Crank_right",
		"Crank_up", "Crank_down"
	)

	#Reset rotation if no direction is inputted this frame    
	if stickVector.length() == 0: 
		totalRotation = 0

	var angle: float = abs(lastAngle - stickVector.angle())
	lastAngle = stickVector.angle()
	totalRotation += angle

	rotation = stickVector.angle()
	
	if totalRotation > 25:
		win.emit()
