extends Control

func _on_Timer_timeout():
	get_tree().change_scene_to_file("res://scenes/ui/credits.tscn")
