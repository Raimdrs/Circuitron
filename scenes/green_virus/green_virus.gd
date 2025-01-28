extends CharacterBody2D

@export var speed := Vector2(50, 0)
@onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

@onready var current_direction := Vector2.RIGHT

func _process(_delta):
	$AnimatedSprite2D.flip_h = current_direction == Vector2.LEFT

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity.x = (speed * current_direction).x;
	
	move_and_slide()


func _on_wall_detector_body_entered(_body):
	if current_direction == Vector2.RIGHT:
		current_direction = Vector2.LEFT
	else:
		current_direction = Vector2.RIGHT
