extends "res://BaseEnemy.gd"

@export var speed : float
	
func _physics_process(delta: float) -> void:
	velocity = Vector2.DOWN * speed
	move_and_slide()

