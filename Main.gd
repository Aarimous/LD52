extends Node2D

export(int, 0, 20) var initialAsteroids = 5

func _ready():
	Game.main = self
	for _i in range(initialAsteroids):
		$"%AsteroidGroup".spawnNewAsteroid()
	SignalBus.emit_signal("startGame")
		
func togglePause(value):
	get_tree().paused = value
