extends Area2D

signal entered_checkpoint

func _process(delta):
	if Globals.respawn_point != $RespawnPoint.global_position:
		$AnimatedSprite2D.play("off")

func _on_body_entered(_body):
	if Globals.respawn_point != $RespawnPoint.global_position && $AnimatedSprite2D.animation != "new_touch":
		$AnimatedSprite2D.play("new_touch")
	entered_checkpoint.emit($RespawnPoint.global_position)


func _on_entered_checkpoint() -> void:
	pass # Replace with function body.
