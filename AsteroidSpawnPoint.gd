extends Node2D

var currentAsteroid : Asteroid = null
var isFree = true


func addAsteroid(_asteroid : Asteroid):
	add_child(_asteroid)
	currentAsteroid = _asteroid
	currentAsteroid.connect("asteroidFlung", self, "_on_asteroidFlung")
	isFree = false


func _on_asteroidFlung(_asteroid):
	if currentAsteroid != null and currentAsteroid == _asteroid:
		currentAsteroid = null
		isFree = true
