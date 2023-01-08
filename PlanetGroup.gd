extends Node2D

func _ready():

	for planetGroup in get_children():
		var animPlay = planetGroup.get_node("AnimationPlayer")
		animPlay.seek(Game.rnGesus.randf_range(0.0, animPlay.current_animation_length))
