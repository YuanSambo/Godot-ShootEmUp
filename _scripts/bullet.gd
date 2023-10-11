extends RigidBody2D

@export var force : float
@export var damage : float


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_hit_box_component_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"): 
		var hitbox : HitBoxComponent = area
		hitbox.damage(damage)
	
	queue_free()
	
func start(pos):
	position = pos
	apply_impulse(Vector2.UP * force, pos)

