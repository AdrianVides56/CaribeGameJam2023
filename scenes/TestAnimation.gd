extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animToPlay
var canPlayAnim = false
var animCompleted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animToPlay = $First
	canPlayAnim = true
#	$First.PlayAnimation()
	#animToPlay.PlayAnimation()
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canPlayAnim:
		animToPlay.PlayAnimation()
		
	if Input.is_action_just_pressed("ui_accept") and animCompleted:
		canPlayAnim = true
		animCompleted = false


func _on_First_animationCompleted():
	$Second.visible = true
	animCompleted = true
	animToPlay = $Second
	canPlayAnim = false
	#$Second.PlayAnimation()


func _on_Second_animationCompleted():
	pass # Replace with function body.


func _on_Second_animationStarted():
	$First.visible = false
	pass # Replace with function body.
