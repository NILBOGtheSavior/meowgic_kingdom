extends Node2D

@onready var player = $Entities/Player
@onready var camera = $Camera

var guard_scene = preload("res://scenes/characters/enemies/guard.tscn")

func _ready():
	player.position = $Entities/HeroSpawn.position
	camera.set_target(player)  # Tell the camera who to follow

	# Spawn enemies
	for marker in $Entities/EnemySpawnPoints.get_children():
		
		var enemy = guard_scene.instantiate()
		enemy.global_position = marker.global_position
		enemy.player = player
		add_child(enemy)
