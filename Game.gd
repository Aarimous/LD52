extends Node


var ASTEROID_IMPULS_SCALE = 2
var IMPACT_SAFE_LIMIT = 69
var main
var currentScore = 10
var gameTimeLength = 60
var rnGesus : RandomNumberGenerator

var isGameOver = false


func _ready():
	rnGesus = RandomNumberGenerator.new()
	rnGesus.randomize()
	newGame()
	
	
func scorePoints(amount):
	if isGameOver == false:
		currentScore += amount
		SignalBus.emit_signal("scoreUpdated", currentScore)
	
func newGame():
	isGameOver = false
	currentScore = 0
	SignalBus.emit_signal("scoreUpdated", currentScore)
	
func gameOver():
	SignalBus.emit_signal("gameOver")
	isGameOver = true
	#main.togglePause(true)
	print("Game Over")
