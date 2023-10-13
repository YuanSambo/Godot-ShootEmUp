class_name Player
extends CharacterBody2D

@export var health_component : HealthComponent
@export var hitbox_component : HitBoxComponent

#@export var speed : float
@export var bounds_offset := 40
@export var bullet : PackedScene

@onready var shoot_cooldown: Timer = $ShootCooldown
@onready var screen_size : Vector2 = Vector2.ZERO



@export var speed = 400
@export var rotation_speed = 2

var rotation_direction = 0


func _ready() -> void:
	screen_size = get_viewport_rect().size
	
	#Signals
	hitbox_component.on_hit.connect(on_player_hit)
	
func _get_input() -> void:
	
	look_at(get_global_mouse_position())
	
	if position.distance_to(get_global_mouse_position()) >= 10:
		velocity = transform.x * Input.get_axis("down", "up") * speed
	else:
		velocity = Vector2.ZERO

func _process(delta: float) -> void:
	_get_input()
		
		
	position.x = clamp(position.x,bounds_offset,screen_size.x-bounds_offset)
	position.y = clamp(position.y,bounds_offset,screen_size.y-bounds_offset)
		
	if Input.is_action_pressed("fire"):
		shoot()
		
func _physics_process(delta):
	_get_input()
	move_and_slide()
	
func shoot() -> void:
	# Return if still on cooldown
	if shoot_cooldown.time_left > 0.0:
		return

	var projectile = bullet.instantiate();
	shoot_cooldown.start()
	get_tree().root.add_child(projectile)
	projectile.start(position + Vector2(0, -10))


func on_player_hit(damage : float) -> void:
	health_component.damage(damage)
	
	Events.player_health_updated.emit(health_component.health)
	print("Player Health: " + str(health_component.health))
