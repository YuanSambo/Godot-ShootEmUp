class_name HitBoxComponent
extends Area2D

signal on_hit(attack:float)

func damage(attack : float):
	on_hit.emit(attack)
