extends CharacterBody2D

@export_category("Movement")
@export var speed : float

@export_category("Bounds")
@export var bounds_offset := 40

@onready var screen_size : Vector2 = Vector2.ZERO


func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func get_input() -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _process(delta: float) -> void:
		get_input()
		position.x = clamp(position.x,bounds_offset,screen_size.x-bounds_offset)
		position.y = clamp(position.y,bounds_offset,screen_size.y-bounds_offset)
		
func _physics_process(delta:float) -> void:
	move_and_slide()
	
	
