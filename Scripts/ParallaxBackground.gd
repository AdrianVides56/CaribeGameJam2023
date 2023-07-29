extends ParallaxBackground

var direction = Vector2(1,0)
var speed = 35

func _physics_process(delta):
	scroll_base_offset += direction * speed * delta
	
