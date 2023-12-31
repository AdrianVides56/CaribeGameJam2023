extends KinematicBody2D

signal damage(value)

var motion = Vector2(0,0)
var direction = 0
var direction2 = 1
var detection = 0
const gravity = 10
var speed = rand_range(60,120)
var knockbackspeed = 250
var jumpenemy = 15
var health = 100
var target = null
var inmunity:bool
var in_hurt:bool
var in_dead:bool
onready var PosE = $Position2D
onready var animE = $AnimatedSprite

# warning-ignore:unused_argument
func _physics_process(delta):
	knockback(direction)
	Death()
	routine()
	
func routine():
	match detection:
		1:
			attack_move()
		
		
		
func attack_move():
	if target != null and !in_dead:
		if global_position.x > target.global_position.x + 5:
			direction = -1
			motion.x = direction*speed
			animE.flip_h = true
			$AnimatedSprite.play("Walk")
		elif global_position.x < target.global_position.x - 5:
			direction = 1
			motion.x = direction*speed
			animE.flip_h = false
			$AnimatedSprite.play("Walk")

			
		motion.x = lerp(motion.x,0,0.1)
		motion.y += gravity
		motion = move_and_slide(motion,Vector2.UP)

func Death():
	if health <= 0:
		motion.x =0
		in_dead = true
		animE.play("dead")
	else:
		in_dead = false
		
func knockback(direction):
	if in_hurt == true:
		motion.x = lerp(motion.x,speed*-direction,0.5)

func _on_playerdetection_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		detection = 1
		
func _on_playerdetection_body_exited(_body):
	target = null
		
func _on_damagearea_body_entered(body):
	if body.is_in_group("Player"):
		target.damage_crtl(10)

func damage_crtl(damage:int):
	if inmunity == false:
		health -= damage
		in_hurt=true
		inmunity = true
		$Timer.start()


func _on_AnimatedSprite_animation_finished():
	if animE.animation == "dead":
		queue_free()


func _on_Timer_timeout():
	inmunity = false
