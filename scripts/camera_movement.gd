extends Node2D

var target: Node2D
var follow_enabled = true

@export var camera_smoothing = 2

func _physics_process(delta):
	if follow_enabled and target:
		var pos = Vector2(target.global_position.x, 300.0)
		global_position = global_position.lerp(pos, camera_smoothing * delta)

func set_target(t):
	target = t
