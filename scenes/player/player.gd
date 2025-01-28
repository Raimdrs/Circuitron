class_name player
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var speed = Vector2(130.0, 500.0)
@onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

var alive = true
var can_pick = true
var _velocity = Vector2.ZERO

func _physics_process(delta):
	if not alive:
		return

	# Aplicar gravidade quando não estiver no chão
	if not is_on_floor():
		_velocity.y += gravity * delta
	
	# Pulo
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		_velocity.y = -speed.y
		$jump.play()

	# Movimento lateral
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		_velocity.x = direction * speed.x
		# Verificar se está no chão antes de mudar para "run"
		if is_on_floor():
			animated_sprite.play("run")
		animated_sprite.flip_h = direction == -1
	else:
		if is_on_floor():
			animated_sprite.play("idle")
		_velocity.x = move_toward(_velocity.x, 0, speed.x)

	# Alterar para animação de pulo
	if not is_on_floor() and _velocity.y < 0:
		animated_sprite.play("jump")
	elif not is_on_floor() and _velocity.y > 0:
		animated_sprite.play("fall") 

	# Atualizar velocidade
	set_velocity(_velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	_velocity = velocity

# Função chamada quando a animação termina
func _on_animated_sprite_2d_animation_finished():
	if animated_sprite.animation == "death":
		if Globals.respawn_point == null:
			get_tree().reload_current_scene()
		else:
			position = Globals.respawn_point
			animated_sprite.play("idle")
			alive = true

# Função chamada ao entrar em uma área de dano
func _on_damage_area_body_entered(_body):
	animated_sprite.play("death")
	alive = false

func _on_checkpoint_entered_checkpoint(pos):
	Globals.respawn_point = pos


func _on_checkpoint_2_entered_checkpoint() -> void:
	pass # Replace with function body.
