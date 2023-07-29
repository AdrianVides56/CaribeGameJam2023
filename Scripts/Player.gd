extends KinematicBody2D

var motion = Vector2()
var direction = 0
var speed = 700
var gravity = 25
var jump = 600
var in_attack :bool



enum {IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK}

var state
var current_animation
var new_animation
onready var anim =$AnimatedSprite

func _ready():
	transition_to(IDLE)
	
# warning-ignore:unused_argument
func _physics_process(delta):
	move()
	jump()
	attack()
	
	if current_animation != new_animation:
		current_animation = new_animation
		anim.play(current_animation)


func move():
	if Input.is_action_pressed("ui_right"):
		direction = 1
		motion.x = direction*speed
		$AnimatedSprite.flip_h = false
		$Position2D.scale.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction = -1
		motion.x = direction*speed
		$AnimatedSprite.flip_h = true
		$Position2D.scale.x = -1
		
	else:
		direction = 0
	motion.x = lerp(motion.x,0,0.3)
	motion.y += gravity
	motion = move_and_slide(motion, Vector2.UP)
	print(direction)
	
	#MAQUINA DE ESTADOS
	
	if state in [IDLE,JUMP,RUN,FALL,HURT,DEATH,ATTACK] and direction!=0: #De quieto a correr
		transition_to(WALK)
	
	if state in [JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and direction == 0: #De correr a quieto
		transition_to(IDLE)
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and !is_on_floor(): #De quieto o correr a salto
		transition_to(JUMP)
		
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH] and in_attack: #De quieto o correr a salto
		transition_to(ATTACK)
	
	if state in [JUMP,FALL] and is_on_floor(): #De salto a quieto
		transition_to(IDLE)
	
	if state == JUMP and motion.y > 0 and !is_on_floor(): #De salto a caida
		transition_to(FALL)

func attack():
	if Input.is_action_pressed("ui_accept"):
		in_attack = true
		$Position2D/attackarea/area.disabled = false
# warning-ignore:function_conflicts_variable
func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = -jump
		
func transition_to(new_state): 
	state = new_state
	match state:
		IDLE:
			new_animation = "Idle"
		JUMP:
			new_animation = "Jump"
		RUN:
			new_animation = "run"
		FALL:
			new_animation = "Fall"
		WALK:
			new_animation = "Walk"
		HURT:
			new_animation = "Hurt"
		DEATH:
			new_animation = "Death"
		ATTACK:
			new_animation = "Attack"
			
func _on_AnimatedSprite_animation_finished():
	if anim.animation == "Attack":
		in_attack = false
		$Position2D/attackarea/area.disabled = true

