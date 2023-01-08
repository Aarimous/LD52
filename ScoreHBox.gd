extends HBoxContainer


func _ready():
	$"%ScoreValue".text = str(Game.currentScore)
	SignalBus.connect("scoreUpdated", self, "_on_scoreUpdated")
	
func _on_scoreUpdated(currentScore):
	$"%ScoreValue".text = str(currentScore)
	pass
