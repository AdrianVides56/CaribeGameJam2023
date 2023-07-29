extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")

func _process(delta):
	pass
	
func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Timer_timeout():
	print("Hello") # Replace with function body.
