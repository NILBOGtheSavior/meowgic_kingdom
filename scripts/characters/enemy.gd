class_name Enemy
extends Character

func _ready():
	connect("body_entered", Callable(self, "_detected_player"))

func _detected_player(d):
	if not d.is_in_group("player"):
		return  # ignore non-player bodies
	print(self)
