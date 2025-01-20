extends Area2D

export (NodePath) var previous

onready var time = $"Timer"

var input

func _physics_process(_delta):
	input = get_node(previous).output

	$Sprite.frame = 1 if input else 0
	$CollisionShape2D.disabled = not input

func _on_door_body_entered(body) -> void:
	if body.name == "player":
		time.start()
		$music_loop_player.stream_paused = true
		$music_level.playing = true

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/levels/level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
