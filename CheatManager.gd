extends Node

func _ready():
	print("Cheat Manager: Ready")
	
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		_restart_game()
	if Input.is_action_just_pressed("exit"):
		_exit_game()

func _restart_game():
	print("Cheat Manager: Restart")
	get_tree().reload_current_scene()

func _exit_game():
	get_tree().quit()


