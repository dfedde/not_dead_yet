extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("Snake_left", "Snake_right", "Snake_up", "Snake_down")
	velocity = input_direction * speed
	rotation = lerp(rotation,velocity.angle(),1)

func _physics_process(_delta):
	get_input()
	move_and_slide()