class_name GameManager
extends Node2D

@onready var player = $Player
@onready var camera = $Camera
@onready var spawn_points = $tutorial_dungeon/SpawnPoints/EnemySpawnPoints

var enemy_scene = preload("res://scenes/characters/enemies/enemy.tscn")

func _ready():
	player.position = $tutorial_dungeon/SpawnPoints/HeroSpawn.position
	camera.set_target(player)  # Tell the camera who to follow
	spawner()

func spawner():
	for marker in spawn_points.get_children(): #TODO Find a way to set specific markers with data that determine enemy type
		var enemy = enemy_scene.instantiate()
		enemy.global_position = marker.global_position
		add_child(enemy)

func engage_combat():
	pass
