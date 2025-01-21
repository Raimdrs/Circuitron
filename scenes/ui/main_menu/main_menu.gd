extends Control

var timer

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_on_Back_pressed()

func ready():
	get_tree().set_quit_on_go_back(false)
	timer = get_node("Timer")
	timer.start()

func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_Back_pressed():
	get_tree().quit()
