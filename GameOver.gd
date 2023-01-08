extends Control


func _ready():
	visible = false
	SignalBus.connect("gameOver", self, "_on_gameOver")
	
func _on_gameOver():
	modulate.a = 0
	$AnimationPlayer.play("OnGameOver")
	visible = true
	
	$"%Final Score".text = str(Game.currentScore)
	

func _on_PlayAgain_button_down():
	get_tree().reload_current_scene()
