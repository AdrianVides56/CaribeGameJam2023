extends KinematicBody2D

var motion = Vector2()
var direction = 0
var speed = 500
var gravity = 15
var jump = 300



enum {IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK}

var state
var current_animation
var new_animation
onready var anim =$AnimatedSprite

func _physics_process(delta):
	move()
	jump()
	
	if current_animation != new_animation:
		current_animation = new_animation
		anim.play(current_animation)


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
	
	#MAQUINA DE ESTADOS
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and direction !=0: #De quieto a correr
		transition_to(RUN)
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and direction == 0: #De correr a quieto
		transition_to(WALK)
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and !is_on_floor(): #De quieto o correr a salto
		transition_to(JUMP)
	
	if state in [JUMP,FALL] and is_on_floor(): #De salto a quieto
		transition_to(IDLE)
	
	if state == JUMP and motion.y > 0 and !is_on_floor(): #De salto a caida
		transition_to(FALL)
		
	if state in [IDLE,RUN,JUMP,WALK,FALL,HURT,ATTACK]:
		transition_to(DEATH)
		
	if state == ATTACK:
		transition_to(IDLE)
	
	if state in [IDLE,RUN,HURT]:
		transition_to(ATTACK)
		
	if state == HURT:
		transition_to(IDLE)
	
	if state in [IDLE,RUN,JUMP,WALK,FALL,HURT,ATTACK]:
		transition_to(HURT)

func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = -jump
		
func transition_to(new_state): 
	state = new_state
	match state:
		IDLE:
			new_animation = "idle"
		JUMP:
			new_animation = "Jump"
		RUN:
			new_animation = "run"
		FALL:
			new_animation = "fall"
		WALK:
			new_animation = "walK"
		HURT:
			new_animation = "Hurt"
		DEATH:
			new_animation = "Death"
		ATTACK:
			new_animation = "attack"
			

	
	


func _on_Area2D_area_entered(area):
	pass # Replace with function body.
