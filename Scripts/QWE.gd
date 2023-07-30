extends Node2D

var enemy_jelly = preload("res://scenes/enemy.tscn")
var acuEnemy = 0
var spawn:bool
onready var timer = $Timer


func _on_Timer_timeout():
	randomAE()
	timer.start()
	
func randomAE():
	var enemyM = enemy_jelly.instance()
	randomize()
	var Apenemy = randi() % 2
	if Apenemy == 0 or Apenemy ==1:
		acuEnemy +=1
	if acuEnemy <= 20:
		match Apenemy:
			0:
				add_child(enemyM)
				enemyM.position = Vector2(40,340)
				print("HOLLO")
	else:
		timer.stop()
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		timer.start()
