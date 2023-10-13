extends Node

@export var player : Player
@export var health_ui : Label

func _ready():
	# Set starting healthUI value
	setup_ui()
	Events.player_health_updated.connect(_update_health_ui)
	
func setup_ui():
#	var player_health = player.health_component.health
#	_update_health_ui(player_health)
	pass
#
func _update_health_ui(health : float ):
	health_ui.text = str(health)
	
