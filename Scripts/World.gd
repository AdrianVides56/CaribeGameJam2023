extends Node2D



func _ready():
	$Timer.start()



func _on_Timer_timeout():
	$plataformas/pla1/PathFollow2D/AnimationPlayer.play("Moving")
