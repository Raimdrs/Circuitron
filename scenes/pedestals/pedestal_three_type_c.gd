extends pedestal_three 

@export var previous: NodePath

@export var previous_2: NodePath

func _process(_delta):
	input = get_node(previous).output
	input_2 = get_node(previous_2).output
	
	busy = get_node(previous).busy_real and get_node(previous_2).busy_real
