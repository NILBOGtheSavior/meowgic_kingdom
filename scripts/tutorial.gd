extends Node2D

@onready var player = $Entities/Player
@onready var body = $Entities/Character/Body
@onready var camera = $Systems/Camera

func _ready():
	body.position = $Entities/HeroSpawn.position
	camera.set_target(body)  # Tell the camera who to follow

	
