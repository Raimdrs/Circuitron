extends CanvasLayer

func _process(_delta):
	$Control/MarginContainer/Timer.text = Globals.formatted_timer()
