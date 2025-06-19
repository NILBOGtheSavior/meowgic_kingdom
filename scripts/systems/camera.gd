extends Node2D

var target: Node2D
var follow_enabled = true

@export var camera_smoothing = 2

func _ready():
	global_position = Vector2(960.0, 540.0)
	connect("registered", Callable(self, "set_target"))

func _physics_process(delta):
	if follow_enabled and target:
		var pos = Vector2(target.global_position.x, 540.0).clamp(Vector2(960.0, 540.0), Vector2(4800.0, 540.0))
		global_position = global_position.lerp(pos, camera_smoothing * delta)

func set_target(t):
	target = t
