extends AnimatableBody2D

@export var speed: float = 80
@export var wait_time: int = 2

@export var start: Marker2D
@export var end: Marker2D

var going_to_destination := true
var waiting := false

func _ready() -> void:
	position = start.position

func _physics_process(delta: float) -> void:
	if waiting:
		return
	var destination := end.global_position if going_to_destination else start.global_position
	position = position.move_toward(destination, speed * delta)
	if position == destination:
		going_to_destination = !going_to_destination
		waiting = true
		$Timer.start(wait_time)

func _on_timer_timeout():
	waiting = false
