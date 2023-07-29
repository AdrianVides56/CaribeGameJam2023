extends Node2D


export(String, MULTILINE) var textToDisplay : String

export (bool) var hasImage
export (Texture) var imageToDisplay


# Called when the node enters the scene tree for the first time.
func _ready():
	# Align Text To Center
	#$RichTextLabel.ALIGN_CENTER
	
	_handleImage()

	if !textToDisplay.empty():
		$RichTextLabel.text = textToDisplay

	$TextureRect.texture = imageToDisplay

	$AnimationPlayer.play("PopUp")
	pass # Replace with function body.

func _handleImage():
	if hasImage:
		$RichTextLabel.anchor_left = 0.5
		$RichTextLabel.anchor_top = 1
		$RichTextLabel.anchor_right = 0.5
		$RichTextLabel.anchor_bottom = 1

		$RichTextLabel.margin_left = -576
		$RichTextLabel.margin_top = -250
		$RichTextLabel.margin_right = 0
		$RichTextLabel.margin_bottom = -162
		
		$TextureRect.visible = true
	else:
		$RichTextLabel.anchor_left = 0.1
		$RichTextLabel.anchor_top = 0.3
		$RichTextLabel.anchor_right = 0.9
		$RichTextLabel.anchor_bottom = 0.7
		
		$TextureRect.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
