extends Control

func _ready():
	$AudioStreamPlayer2D.play()

func _on_play_pressed():
# warning-ignore:return_value_discarded
	pass


func _on_Opciones_pressed():
	pass # Replace with function body.



func _on_Salir_pressed():
	get_tree().quit()
