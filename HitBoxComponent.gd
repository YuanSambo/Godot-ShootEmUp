extends Area2D
class_name HitBoxComponent

signal on_hit(attack:float)

func damage(attack : float):
	on_hit.emit(attack)
