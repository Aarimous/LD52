extends Node2D

export var asteroidPacked : PackedScene

export var isMainMenu : bool = false
export(float, 0.1, 100.0, 0.1) var asteroidSpawnRate = 5.0

export(NodePath) var partetNodeForAsteroid 
var asteroidSpawnTimer = asteroidSpawnRate


func _ready():
	pass
#	for _i in range(initialAsteroids):
#		spawnNewAsteroid()


func _process(delta):
	asteroidSpawnTimer -= delta
	if asteroidSpawnTimer <= 0:
		spawnNewAsteroid()
		asteroidSpawnTimer = asteroidSpawnRate


func spawnNewAsteroid():
	var spawnPoint = getRandomOpenSpawnPoint()
	if spawnPoint != null:
		var parentNode
		if isMainMenu == true:
			parentNode = get_parent()
		else:
			parentNode = Game.main
		var newAsteroid = asteroidPacked.instance().init(isMainMenu, parentNode)
		spawnPoint.addAsteroid(newAsteroid)
	pass
	
func getRandomOpenSpawnPoint():
	var openSpawnPoints = []
	for spawnPoint in get_children():
		if spawnPoint.is_in_group("AsteroidSpawnPoint") and spawnPoint.isFree == true:
			openSpawnPoints.append(spawnPoint)
			
	if openSpawnPoints.size() > 0:
		var randomSpawnPoint = openSpawnPoints[Game.rnGesus.randi_range(0, openSpawnPoints.size() -1)]
		if 	randomSpawnPoint != null:
			return randomSpawnPoint
		else:
			push_warning("AsteroidGroup.getRandomOpenSpawnPoint did not find an point to return even though is should have, fix this!")
	else:
		print("AsteroidGroup.getRandomOpenSpawnPoint did not find any open spawn points")
