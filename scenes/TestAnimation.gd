extends Node2D

var animToPlay
var canPlayAnim = false
var animCompleted = false
var currentAnimation
var i = 0

var animations
	

# Called when the node enters the scene tree for the first time.
func _ready():
	animations = [get_node("First"), get_node("Second"), get_node("Third"), get_node("Fourth"), get_node("Fifth"), get_node("Sixth")]
	currentAnimation = animations[i]
	animToPlay = currentAnimation
	canPlayAnim = true
	animToPlay.PlayAnimation()


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and animCompleted and canPlayAnim:
		PlayNextAnim()
		pass

func PlayNextAnim():
	currentAnimation.visible = false
	i += 1
	if i < len(animations):
		animToPlay = animations[i]
		animToPlay.visible = true
		currentAnimation = animToPlay
		animToPlay.PlayAnimation()

func OnAnyAnimationStarted():
	canPlayAnim = false
	animCompleted = false
	
func OnAnyAnimationCompleted():
	animCompleted = true
	canPlayAnim = true

func _on_First_animationStarted():
	OnAnyAnimationStarted()
	pass # Replace with function body.


func _on_Second_animationStarted():
	OnAnyAnimationStarted()
	$First.visible = false
	pass # Replace with function body.


func _on_Third_animationStarted():
	OnAnyAnimationStarted()
	pass # Replace with function body.


func _on_Fourth_animationStarted():
	OnAnyAnimationStarted()
	pass # Replace with function body.
	
	
func _on_Fifth_animationStarted():
	OnAnyAnimationStarted()
	pass # Replace with function body.


func _on_Sixth_animationStarted():
	OnAnyAnimationStarted()
	pass # Replace with function body.


func _on_First_animationCompleted():
	$Second.visible = true
	animCompleted = true
	animToPlay = $Second
	canPlayAnim = false
	OnAnyAnimationCompleted()


func _on_Second_animationCompleted():
	OnAnyAnimationCompleted()
	pass # Replace with function body.


func _on_Third_animationCompleted():
	OnAnyAnimationCompleted()
	pass # Replace with function body.


func _on_Fourth_animationCompleted():
	OnAnyAnimationCompleted()
	pass # Replace with function body.


func _on_Fifth_animationCompleted():
	OnAnyAnimationCompleted()
	pass # Replace with function body.


func _on_Sixth_animationCompleted():
	OnAnyAnimationCompleted()
	pass # Replace with function body.


