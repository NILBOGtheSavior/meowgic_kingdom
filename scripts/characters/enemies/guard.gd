extends CharacterBody2D

var player : Node2D

signal combat_started(enemy_node)

func _process(_delta):
	var distance = global_position.distance_to(player.global_position)
	
	if distance < 10:
		emit_signal("combat_started", self)
