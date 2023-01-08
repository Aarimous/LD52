extends RigidBody2D
class_name Asteroid

signal asteroidKillingItself
signal asteroidFlung

export var isMainMenu = false
var parentNode

var direction : Vector2 = Vector2.ZERO
var speed : float = 0.0
var velocity : Vector2 = speed * direction

func init(_isMainMenu : bool, _parentNode):
	isMainMenu = _isMainMenu
	print(_parentNode)
	parentNode = _parentNode
	var randRoll
	if isMainMenu == false:
		randRoll = Game.rnGesus.randf_range(.75, 2)
	else:
		randRoll = 2
	mass = randRoll
	$"%SpritePivot".modulate.h = Game.rnGesus.randf_range(0,1.0)
	$"%SpritePivot".scale = Vector2(randRoll,randRoll)
	$"%CollisionPolygon2D".scale = Vector2(randRoll,randRoll)
	angular_velocity = Game.rnGesus.randf_range(-69.0/42.0, 69.0/42.0)
	return self


func onFling(_speed, _direction):
	velocity = _speed * _direction
	apply_central_impulse(velocity * Game.ASTEROID_IMPULS_SCALE)
	
	emit_signal("asteroidFlung", self)


func _on_Asteroid_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed() == true:
				var pos = global_position
				get_parent().remove_child(self)
				parentNode.add_child(self)
				position = pos
				Flinger.startFlinging(self)
				print("Mouse Button Click")


func kill():
	
	emit_signal("asteroidKillingItself", self)
	queue_free()


func _on_Asteroid_body_entered(body):
	var force = linear_velocity.length()
	if isMainMenu == true:
		if body.is_in_group("MainMenu"):
			if force < Game.IMPACT_SAFE_LIMIT:
				parentNode.startGame()
				kill()
			else:
				parentNode.hitStartTooHard()	
	else:
		
		if body.is_in_group("Sun"):
			kill()
		elif body.is_in_group("Planet"):
			if force < Game.IMPACT_SAFE_LIMIT:
				Game.scorePoints(1)
			else:
				Game.scorePoints(-1)
				body.takeDamage(force - Game.IMPACT_SAFE_LIMIT)
			kill()
		elif body.is_in_group("Asteroid"):
			if force > Game.IMPACT_SAFE_LIMIT:
				body.kill()
				kill()

