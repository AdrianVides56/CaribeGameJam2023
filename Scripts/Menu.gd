extends Control

func _ready():
	$AudioStreamPlayer2D.play()


func _on_Exit_pressed():
	get_tree().quit()


func _on_play_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Node2D.tscn")
