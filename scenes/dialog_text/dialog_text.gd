extends Node

@export var previous: NodePath

var react

func _process(_delta):
	react = get_node(previous).play
	self.modulate.a8 = 150
	self.position = get_node("../player/Camera2D/dialog").global_position
	self.visible = react
