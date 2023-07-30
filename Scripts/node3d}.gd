extends Node2D

func _ready():
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/Menu.tscn")
