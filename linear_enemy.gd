extends "res://base_enemy.gd"

@export var speed : float
	
func _physics_process(delta: float) -> void:
	velocity = Vector2.DOWN * speed
	move_and_slide()

