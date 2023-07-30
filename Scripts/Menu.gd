extends Control

func _ready():
	$AudioStreamPlayer2D.play()

func _on_play_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/CutsceneController.tscn")
	pass


func _on_Salir_pressed():
	get_tree().quit()
