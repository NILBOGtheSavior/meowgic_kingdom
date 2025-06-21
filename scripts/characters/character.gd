extends CharacterBody2D
class_name Character

@export var combat_manager : Node2D

# Ability levels
@export var move_speed = 100.0

var is_moving = false
var move_target = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	if is_moving:
		move_to_point(move_target, delta)
	update_z_and_scale()

func update_z_and_scale():
	z_index = int(position.y)
	var scale_factor = lerp(0.5, 1.2, clamp(position.y / 1080.0, 0.0, 1.0))
	scale = Vector2(scale_factor, scale_factor)

func move_to_point(point : Vector2, delta):
	if position.distance_to(point) < 1.0:
		position = lerp(position, point, delta * move_speed)
	else:
		position = point
		is_moving = false
		
