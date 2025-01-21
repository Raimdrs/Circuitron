extends pedestal_three 

@export var previous: NodePath

func _process(_delta):
	input_2 = get_node(previous).output
	busy = get_node(previous).busy_real
