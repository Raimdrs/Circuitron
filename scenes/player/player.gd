class_name player extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var speed = Vector2(130.0, 500.0)
@onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

var can_pick = true
var _velocity = Vector2.ZERO

func _physics_process(delta):
	if not is_on_floor():
		_velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		_velocity.y = -speed.y
		$jump.play()

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		_velocity.x = direction * speed.x
		anim_switch("run")
		animated_sprite.flip_h = direction == -1
	else:
		anim_switch("idle")
		_velocity.x = move_toward(_velocity.x, 0, speed.x)
	set_velocity(_velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	_velocity = velocity

func anim_switch(animation):
	var new_anim = str(animation)
	if animated_sprite.animation != new_anim:
		animated_sprite.play(new_anim)
