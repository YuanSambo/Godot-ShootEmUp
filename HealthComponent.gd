extends Node2D
class_name  HealthComponent

@export var max_health : float
var health : float

func _ready() -> void:
	health = max_health

func damage(attack : float) -> void:
	health -= attack
	
	if health <= 0:
		get_parent().queue_free()
