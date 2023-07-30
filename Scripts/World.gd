extends Node2D



func _ready():
	$Timer.start()



func _on_Timer_timeout():
	$plataformas/pla1/PathFollow2D/AnimationPlayer.play("Moving")


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://scenes/TestScenes/world2.tscn")
	pass # Replace with function body.


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
