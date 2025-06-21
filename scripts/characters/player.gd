extends Character

@export var movement_enabled = true
@export var max_speed: float = 350.0
@export var acceleration: float = 800.0
@export var friction: float = 400.0

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	if movement_enabled:
		if Input.is_action_pressed("move_left"):
			input_dir.x -= 1
		if Input.is_action_pressed("move_right"):
			input_dir.x += 1
		if Input.is_action_pressed("move_up"):
			input_dir.y -= 0.25
		if Input.is_action_pressed("move_down"):
			input_dir.y += 0.25

	input_dir = input_dir.normalized()

	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()

func _ready():
	add_to_group("player")
