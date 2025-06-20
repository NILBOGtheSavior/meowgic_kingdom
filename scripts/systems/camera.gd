class_name Camera
extends Camera2D

var target: Node2D

@export_enum("zoom_0", "zoom_1", "zoom_2") var camera_mode := "zoom_0"

var zoom_level = {
	"zoom_0": Vector2(1, 1),
	"zoom_1": Vector2(1.5, 1.5),
	"zoom_2": Vector2(2, 2)
}

@export var camera_smoothing := 2.0
@export var camera_bounds_min := Vector2(960, 540)
@export var camera_bounds_max := Vector2(4800, 540)

@onready var camera = $Camera2D

func _ready():
	global_position = Vector2(960.0, 540.0)
	connect("registered", Callable(self, "set_target"))

func _physics_process(delta):
	if target:
		var pos = target.global_position.clamp(camera_bounds_min, camera_bounds_max)
		global_position = global_position.lerp(pos, camera_smoothing * delta)
		var target_zoom = zoom_level.get(camera_mode, zoom_level["zoom_0"])
		zoom = zoom.lerp(target_zoom, camera_smoothing * delta)
	else:
		print("Searching for target...")
		var pos = target.global_position.clamp(camera_bounds_min, camera_bounds_max)
		global_position = global_position.lerp(pos, camera_smoothing * delta)

func set_target(t):
	target = t

func set_camera_zoom(target_zoom):
	camera_mode = target_zoom
