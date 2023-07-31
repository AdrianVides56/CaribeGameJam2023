extends KinematicBody2D

var motion = Vector2()
var direction = 0
var speed = 700
var knockback = 400
const gravity = 15
var jump = 500
var in_attack :bool
var health :int = 100
var in_move:bool 
var in_dead:bool
var inmunity:bool
var target = null
var in_hurt:bool
var get
var get2
var backx
var backy
var fire:bool



var lastP

var diamondcount = 0 setget setdiamondcount
func setdiamondcount(value):
	$CanvasLayer/Label.text = str(value)
	diamondcount += 1



enum {IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK}

var state
var current_animation
var new_animation
onready var anim =$AnimatedSprite

func _ready():
	transition_to(IDLE)
	$CanvasLayer/AnimatedSprite.play("idle")
	
	
# warning-ignore:unused_argument
func _physics_process(delta):
	move()
	Jump()
	attack()
	knockback(direction)
	Death()
	Fall()
	comeback()
	
	
	
	if current_animation != new_animation:
		current_animation = new_animation
		anim.play(current_animation)


func move(): #Funcion de movimiento
	in_move = true
	if Input.is_action_pressed("ui_left") and !in_dead and !in_attack:
		if in_move == true:
			direction = -1
			motion.x=direction*speed
			anim.flip_h=true
			$Position2D.scale.x = -1
		
	elif Input.is_action_pressed("ui_right") and !in_dead and !in_attack:
		if in_move == true:
			direction = 1
			motion.x=direction*speed
			anim.flip_h=false
			$Position2D.scale.x = 1
	else:
		in_move = false

	motion.x = lerp(motion.x,0,0.3)
	motion.y += gravity
	motion = move_and_slide(motion, Vector2.UP)
	

	
	#MAQUINA DE ESTADOS
	
	if state in [IDLE,JUMP,RUN,FALL,HURT,DEATH,ATTACK] and in_move == true and !in_dead: #De quieto a correr
		transition_to(WALK)
	
	if state in [JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and in_move == false and !in_dead: #De correr a quieto
		transition_to(IDLE)
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and !is_on_floor() and !in_dead: #De quieto o correr a salto
		transition_to(JUMP)
		
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH,ATTACK] and in_dead: #De quieto o correr a salto
		transition_to(DEATH)
		
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH] and in_attack and !in_dead: #De quieto o correr a salto
		transition_to(ATTACK)
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH] and in_hurt and !in_dead: #De quieto o correr a salto
		transition_to(HURT)
	
	if state in [JUMP,FALL] and is_on_floor() and !in_dead: #De salto a quieto
		transition_to(IDLE)
	
	if state in [IDLE,JUMP,RUN,FALL,WALK,HURT,DEATH] and in_attack and !in_dead: #De quieto o correr a salto
		transition_to(ATTACK)
	
	if state == JUMP and motion.y > 0 and !is_on_floor() and !in_dead: #De salto a caida
		comeback()
		transition_to(FALL)

func comeback():
	if is_on_floor():
		lastP = Vector2(position.x+(-direction*30),position.y-40)
		

func Fall():
	get = $RayCast2D.get_collider()
	if get != null and get.is_in_group("llamas"):
		damage_crtl(20)
		revive()
		
func revive():
	position = lastP

func attack():
	if Input.is_action_pressed("ui_accept") and in_hurt == false:
		in_attack = true
		$Position2D/attackarea/area.disabled = false
		
func Jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and !in_dead:
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
	if anim.animation == "Hurt":
		in_hurt = false
	if anim.animation == "Death":
#		get_tree().paused = true
		get_tree().change_scene("res://scenes/Game Over.tscn")

func Death():
	if health <= 0:
		motion.x =0
		in_dead = true
	else:
		in_dead = false
		
# warning-ignore:function_conflicts_variable
# warning-ignore:shadowed_variable
# warning-ignore:function_conflicts_variable
func knockback(direction):
	if in_hurt == true and !in_dead:
		motion.x = lerp(motion.x,knockback*-direction,0.5)

func damage_crtl(damage:int):
	if inmunity == false:
		health -= damage
		in_hurt=true
		inmunity = true
		$Timer.start()

func _on_attackarea_body_entered(body):
	target = body
	if body.is_in_group("Enemy"):
		target.damage_crtl(50)


# warning-ignore:unused_argument
func _on_attackarea_body_exited(body):
	target = null


func _on_Timer_timeout():
	inmunity = false
