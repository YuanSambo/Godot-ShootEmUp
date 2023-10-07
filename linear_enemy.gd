extends "res://base_enemy.gd"

@export var speed : float
	
func _process(delta):
	position += Vector2.DOWN * speed
	

