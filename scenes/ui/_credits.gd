extends Control

func _ready():
	get_tree().set_quit_on_go_back(false)

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_Back_pressed()

func _on_retornar_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu/main_menu.tscn")

func _on_Back_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu/main_menu.tscn")
