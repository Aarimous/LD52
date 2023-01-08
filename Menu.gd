extends Node2D


func startGame():
	$"%AnimationPlayer".play("FadeToDark")
	print("Start Game")

func changeSecen():
	get_tree().change_scene("res://Main.tscn")

func hitStartTooHard():
	print("hitStartTooHard")
