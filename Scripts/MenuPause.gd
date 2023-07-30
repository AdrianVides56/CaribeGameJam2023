extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		print("Hleoo")
		self.is_paused = !is_paused


func set_is_paused(value):
	is_paused = value
	visible = is_paused
	emit_signal("pauseToggle")


func _on_Continue_pressed():
	self.is_paused = false
	visible = is_paused
# warning-ignore:return_value_discarded
	pass


func _on_Exit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")
