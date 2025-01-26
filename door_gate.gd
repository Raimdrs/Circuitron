extends StaticBody2D

@export var previous: NodePath  # Nó anterior (ex.: pedestal)

var input = false  # Estado do pedestal ou outro nó
var is_open = false  # Estado da porta (aberta ou fechada)

func _physics_process(_delta):
	# Verifica o estado do input (se o pedestal está ativado)
	var new_input = get_node(previous).output
	
	# Abre a porta se o input estiver ativado e a porta não estiver aberta
	if new_input and not is_open:
		abrir_porta()

	# Fecha a porta se o input estiver desativado e a porta estiver aberta
	elif not new_input and is_open:
		fechar_porta()

func abrir_porta():
	is_open = true
	# Desativa o CollisionShape2D para liberar o caminho
	$GateCollision.disabled = true
	
	# Reproduz a animação de abertura
	if $AnimatedSprite2D.is_playing() == false:
		$AnimatedSprite2D.play("abrir") 

func fechar_porta():
	is_open = false
	# Reativa o CollisionShape2D para bloquear o caminho
	$GateCollision.disabled = false
	
	# Reproduz a animação de fechamento 
	if $AnimatedSprite2D.is_playing() == false:
		$AnimatedSprite2D.play("fechar")  
