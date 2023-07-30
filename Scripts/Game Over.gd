extends Control

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$VBoxContainer/Menu.emit_signal("pressed")
	if Input.is_action_just_pressed("ui_accept"):
		$VBoxContainer/Retry.emit_signal("pressed")


func _on_Menu_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")
	

func _on_Retry_pressed():
# warning-ignore:return_value_discarded
	pass
