extends KinematicBody2D

var motion = Vector2(0,0)
var direction = 0
const gravity = 10
var speed = rand_range(60,120)
var knockbackspeed = 250
var jumpenemy = 15
var target = null
onready var PosE = $Position2D
onready var animE = $Position2D/AnimatedSprite

func _physics_process(delta):
	attack_move()
	

func attack_move():
	if target != null:
		if global_position.x > target.global_position.x + 5:
			direction = -1
			motion.x = direction*speed
			animE.flip_h = true
			$Position2D/AnimatedSprite.play("Walk")
		elif global_position.x < target.global_position.x - 5:
			direction = 1
			motion.x = direction*speed
			animE.flip_h = false
			$Position2D/AnimatedSprite.play("Walk")

			
		motion.x = lerp(motion.x,0,0.1)
		motion.y += gravity
		motion = move_and_slide(motion,Vector2.UP)
		
		
func _on_playerdetection_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		
func _on_playerdetection_body_exited(_body):
	target = null
