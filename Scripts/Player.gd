extends KinematicBody2D

var motion = Vector2()
var direction = 0
var speed = 500
var gravity = 15
var jump = 300

func _physics_process(delta):
	move()
	jump()


func move():
	if Input.is_action_pressed("ui_right"):
		direction = 1
		motion.x = direction*speed
	elif Input.is_action_pressed("ui_left"):
		direction = -1
		motion.x = direction*speed
	else:
		motion.x = 0
	motion.x = lerp(motion.x,0,0.3)
	motion.y += gravity
	motion = move_and_slide(motion, Vector2.UP)

func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = -jump
