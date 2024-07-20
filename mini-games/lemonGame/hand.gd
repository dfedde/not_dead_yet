extends CharacterBody2D

@export var speed = 600
var stab = false
var over = false
signal win
signal fail

func _input(event):
	if Input.is_action_just_pressed("Lemon_action"):
		stab = true

func _physics_process(_delta):
	if over:
		velocity = Vector2()
	elif stab:
		velocity = Vector2.DOWN * speed
	else:
		velocity = Vector2.LEFT * speed
	move_and_slide()

func _on_collision_shape_2d_win():
	over = true


func _on_collision_shape_2d_fail():
	over = true
