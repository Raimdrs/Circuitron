class_name player extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

export var speed = Vector2(150.0, 500.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

const ACCELERATION = 30

var can_pick = true
var _velocity = Vector2.ZERO

func _physics_process(_delta):
	_velocity.y += gravity * _delta
	var friction = false
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	if direction.x == 0:
		anim_switch("idle")
		friction = true
	else:
		anim_switch("run")
		animated_sprite.flip_h = direction == -1
	
	_velocity.x = clamp(_velocity.x + direction.x * ACCELERATION, -speed.x, speed.x)
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			_velocity.y = -speed.y
			$jump.play()
		if friction:
			_velocity.x = lerp(_velocity.x , 0, 0.2)
	else:
		if _velocity.y > 0:
			anim_switch("fall")
		else:
			anim_switch("jump")
		if friction:
			_velocity.x = lerp(_velocity.x , 0, 0.6)
	_velocity = move_and_slide(_velocity, Vector2.UP)

func anim_switch(animation):
	var new_anim = str(animation)
	if animated_sprite.animation != new_anim:
		animated_sprite.play(new_anim)
