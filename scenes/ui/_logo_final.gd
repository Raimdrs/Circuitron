extends Control

func _on_Timer_timeout():
	get_tree().change_scene_to_file("res://scr/user_interface/credits.tscn")
