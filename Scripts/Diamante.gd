extends Area2D

onready var AnimatedSprite = $AnimatedSprite



# warning-ignore:unused_argument
func _on_Diamante_body_entered(body):
	if body.is_in_group("Player"):
		body.diamondcount += 1
		queue_free()


