extends Node

func _ready():
	SilentWolf.configure({
		"api_key": "Q1bARqYP402bF3VkEY71E1SIJVY0VMyI9xpULff4",
		"game_id": "AsteroidRush",
		"game_version": "1.0.2",
		"log_level": 1
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})
	
	SilentWolf.Scores.persist_score("test", 10)
	
	yield(SilentWolf.Scores.get_high_scores(), "sw_scores_received")
	print("Scores: " + str(SilentWolf.Scores.scores))
