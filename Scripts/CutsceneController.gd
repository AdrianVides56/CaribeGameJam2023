extends Node2D

export(String, MULTILINE) var textToDisplay : String

export (bool) var hasImage
export (Texture) var imageToDisplay


signal animationCompleted
signal animationStarted


# Called when the node enters the scene tree for the first time.
func _ready():
	# Align Text To Center
	#$RichTextLabel.ALIGN_CENTER
	
	_handleImage()
	
	$Sprite.visible = false

	if !textToDisplay.empty():
		$Sprite/RichTextLabel.text = textToDisplay

	$Sprite/TextureRect.texture = imageToDisplay

	#$AnimationPlayer.play("PopUp")
	pass # Replace with function body.

func _handleImage():
	if hasImage:
		$Sprite/RichTextLabel.anchor_left = 0.5
		$Sprite/RichTextLabel.anchor_top = 1
		$Sprite/RichTextLabel.anchor_right = 0.5
		$Sprite/RichTextLabel.anchor_bottom = 1

		$Sprite/RichTextLabel.margin_left = -576
		$Sprite/RichTextLabel.margin_top = -250
		$Sprite/RichTextLabel.margin_right = 0
		$Sprite/RichTextLabel.margin_bottom = -162
		
		$Sprite/TextureRect.visible = true
	else:
		$Sprite/RichTextLabel.anchor_left = 0.1
		$Sprite/RichTextLabel.anchor_top = 0.3
		$Sprite/RichTextLabel.anchor_right = 0.9
		$Sprite/RichTextLabel.anchor_bottom = 0.7
		
		$Sprite/TextureRect.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func PlayAnimation():
	$Sprite.visible = true
	$AnimationPlayer.play("PopUp")

func _on_Animation_finished(anim_name):
	emit_signal("animationCompleted")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_started(anim_name):
	emit_signal("animationStarted")
	pass # Replace with function body.
