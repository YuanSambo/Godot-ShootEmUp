extends CharacterBody2D

@export var health_component : HealthComponent
@export var hitbox_component : HitBoxComponent

func _ready() -> void:
	hitbox_component.on_hit.connect(on_enemy_hit)
	
# When collided with player
func _on_hit_box_component_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		var hitbox : HitBoxComponent = area
		hitbox.damage(1)
	
func on_enemy_hit(damage : float):
	health_component.damage(damage)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
