extends RigidBody2D

@export var force : float

func start(pos):
	position = pos
	apply_impulse(Vector2.UP * force, pos)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
