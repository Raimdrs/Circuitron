extends Control

func _ready():
	get_tree().set_quit_on_go_back(false)
	visible = false

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_on_Back_pressed()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused

func _on_retomar_pressed():
	hide()
	get_tree().paused = false
	

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scr/user_interface/main_menu.tscn")

func _on_Back_pressed():
	visible = not get_tree().paused
	get_tree().paused = not get_tree().paused
