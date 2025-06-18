extends Node2D

@onready var player = $Entities/HeroCat
@onready var camera = $Camera

var enemy_scene = preload("res://scenes/characters/assasin_cat.tscn")

func _ready():
	player.position = $Entities/HeroSpawn.position
	camera.set_target(player)  # Tell the camera who to follow
	
	# Spawn enemies
	for marker in $Entities/EnemySpawnPoints.get_children():
		
		var enemy = enemy_scene.instantiate()
		enemy.global_position = marker.global_position
		enemy.player = player
		add_child(enemy)
