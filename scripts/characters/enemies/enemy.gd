class_name Enemy
extends Character

signal combat_started(enemy_node)

func _ready():
	connect("body_entered", Callable(self, "_detected_player"))

func _detected_player(body):
	if not body.is_in_group("player"):
		return  # ignore non-player bodies
	print(self)
