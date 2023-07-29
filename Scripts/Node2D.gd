extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().change_scene("res://scenes/MenuPause.tscn")

