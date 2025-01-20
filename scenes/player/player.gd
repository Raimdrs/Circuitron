class_name player extends KinematicBody2D

export var speed = Vector2(150.0, 500.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

const ACCELERATION = 30

var can_pick = true
var _velocity = Vector2.ZERO

onready var animation_player = $animation

func _physics_process(_delta):
	_velocity.y += gravity * _delta
	var friction = false

	if Input.is_action_pressed("ui_right"):
		_velocity.x = min(_velocity.x + ACCELERATION, speed.x)
		anim_switch("run")
		$sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		_velocity.x = max(_velocity.x - ACCELERATION, -speed.x)
		anim_switch("run")
		$sprite.flip_h = true
	else:
		anim_switch("idle")
		friction = true

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
	if animation_player.current_animation != new_anim:
		animation_player.play(new_anim)
