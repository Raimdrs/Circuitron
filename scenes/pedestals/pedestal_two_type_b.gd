extends pedestal_two 

@export var previous: NodePath 

func _process(_delta):
	input = get_node(previous).output
	busy = get_node(previous).busy_real
