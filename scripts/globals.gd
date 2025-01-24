extends Node

var time_elapsed := 0.0
var is_time_stopped := false

var respawn_point = null

func _process(delta):
	if !is_time_stopped:
		time_elapsed += delta

func formatted_timer():
	var hours := time_elapsed / 3600
	var minutes := (int(time_elapsed) % 3600) / 60
	var seconds := (int(time_elapsed) % 3600) % 60
	
	if time_elapsed <= 3600:
		return "%02d:%02d" % [minutes, seconds]
	return "%02d:%02d:%02d" % [hours, minutes, seconds]

func reset_timer():
	time_elapsed = 0.0
	is_time_stopped = false

func stop_timer():
	is_time_stopped = true
