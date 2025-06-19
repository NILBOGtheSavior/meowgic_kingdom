extends Node2D

# Load enemy types 
var guard_scene = preload("res://scenes/characters/enemies/enemy.tscn")

# Spawn enemies
func spawner():
	
	for marker in $Entities/EnemySpawnPoints.get_children(): #TODO Find a way to set specific markers with data that determine enemy type
		
		var enemy = guard_scene.instantiate()
		enemy.global_position = marker.global_position
		add_child(enemy)

func spawn_enemy(position):
	pass
