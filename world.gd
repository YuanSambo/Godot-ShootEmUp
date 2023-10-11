extends Node

@onready var health_ui = $CanvasLayer/HealthUI

func _ready():
	# Set starting healthUI value
	Events.player_health_updated.connect(_update_health_ui)

func _update_health_ui(health : float ):
	print("Health UI Updated")
	health_ui.text = str(health)
	
