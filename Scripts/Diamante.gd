extends Area2D

onready var AnimatedSprite = $AnimatedSprite

var diamondcount = 0

# warning-ignore:unused_argument
func _on_Diamante_body_entered(body):
	if body.is_in_group("Player"):
		body.diamondcount += 1
		queue_free()
		print(body.diamondcount)

