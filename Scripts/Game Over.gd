extends Control



func _on_Play_pressed():
	get_tree().change_scene("res://scenes/Node2D.tscn")


func _on_Exit_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")
