extends Node2D

export(String, MULTILINE) var textToDisplay : String

export (bool) var hasImage
export (Texture) var imageToDisplay
export (int) var XImageOffset


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
		$Sprite/RichTextLabel.anchor_left = 0.057
		$Sprite/RichTextLabel.anchor_top = 0.642
		$Sprite/RichTextLabel.anchor_right = 0.944
		$Sprite/RichTextLabel.anchor_bottom = 0969

		$Sprite/RichTextLabel.margin_left = -268
		$Sprite/RichTextLabel.margin_top = -162
		$Sprite/RichTextLabel.margin_right = -288
		$Sprite/RichTextLabel.margin_bottom = -162
		
		
#		$Sprite/TextureRect.anchor_left = 0.239
#		$Sprite/TextureRect.anchor_top = 0.073
#		$Sprite/TextureRect.anchor_right = 0.76
#		$Sprite/TextureRect.anchor_bottom = 0.604
##
#		$Sprite/TextureRect.margin_left = -288
#		$Sprite/TextureRect.margin_top = -162
#		$Sprite/TextureRect.margin_right = -288
#		$Sprite/TextureRect.margin_bottom = -162

		if XImageOffset != 0:
			$Sprite/TextureRect.rect_position.x += XImageOffset
#			$Sprite/TextureRect.rect_position = Vector2(-150, -138)
#
		$Sprite/TextureRect.rect_size.x = 300
		
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
