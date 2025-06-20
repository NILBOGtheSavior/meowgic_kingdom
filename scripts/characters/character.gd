extends CharacterBody2D
class_name Character

@onready var body = $Body
@onready var sprite = $Body/AnimatedSprite2D

@export var combat_manager: Node2D
@export var texture_path: Resource  # Set this in the Inspector

# Ability levels
@export var move_speed = 100.0

func _ready():
	if texture_path:
		sprite.texture = texture_path
	if combat_manager == null:
		combat_manager = get_node("/Systems/CombatManager")

func _process(delta):
	update_z_and_scale()

func update_z_and_scale():
	z_index = int(position.y)
	var scale_factor = lerp(0.5, 1.2, clamp(position.y / 1080.0, 0.0, 1.0))
	scale = Vector2(scale_factor, scale_factor)
