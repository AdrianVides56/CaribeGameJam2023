extends Node2D



func _ready():
	$Timer.start()



func _on_Timer_timeout():
	$plataformas/pla1/PathFollow2D/AnimationPlayer.play("Moving")


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://scenes/world2.tscn")
