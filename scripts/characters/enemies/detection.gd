extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if not body.is_in_group("player"):
		return  # ignore non-player bodies
	print("Player entered range:", body.name)
	# your combat/event logic here
	
