extends CharacterBody2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("Projectile"):
		body.queue_free()
		queue_free()



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
