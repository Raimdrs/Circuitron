extends Control

var timer

func ready():
	get_tree().set_quit_on_go_back(false)
	timer = get_node("Timer")
	timer.start()

func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	
func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/credits.tscn")

func _on_Back_pressed():
	get_tree().quit()
