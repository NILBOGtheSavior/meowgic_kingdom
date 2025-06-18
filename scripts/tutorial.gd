extends Node2D

@onready var player = $Entities/HeroCat
@onready var camera = $Camera

func _ready():
	camera.set_target(player)  # Tell the camera who to follow
	
	
