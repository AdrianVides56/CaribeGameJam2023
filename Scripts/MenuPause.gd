extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		self.is_paused = !is_paused


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Continue_pressed():
	self.is_paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Node2D.tscn")


func _on_Exit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")
