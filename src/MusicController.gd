extends Node

var menu_music = load("res://Music/Menu Music.mp3")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func playMusic():
	$Music.stream = menu_music
	$Music.play()
