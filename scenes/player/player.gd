class_name player extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var speed = Vector2(130.0, 500.0)
@onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

var alive = true
var can_pick = true
var _velocity = Vector2.ZERO

func _physics_process(delta):
	if not alive:
		return

	if not is_on_floor():
		_velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		_velocity.y = -speed.y
		$jump.play()

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		_velocity.x = direction * speed.x
		animated_sprite.play("run")
		animated_sprite.flip_h = direction == -1
	else:
		animated_sprite.play("idle")
		_velocity.x = move_toward(_velocity.x, 0, speed.x)
	set_velocity(_velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	_velocity = velocity

func _on_animated_sprite_2d_animation_finished():
	if animated_sprite.animation == "death":
		get_tree().reload_current_scene()

func _on_damage_area_body_entered(_body):
	animated_sprite.play("death")
	alive = false
