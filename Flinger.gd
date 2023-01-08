extends Node


var asteroid : Asteroid

func startFlinging(_asteroid):
	if _asteroid is Asteroid:
		asteroid = _asteroid
		asteroid.connect("asteroidKillingItself", self, "_on_asteroidKillingItself")
		SignalBus.emit_signal("toggleAimer", true)
	else:
		push_error("Dumb-bo you tried to fling a non asteroid, fix this!!!")


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed() == false:
				stopFlinging()

func stopFlinging():
	SignalBus.emit_signal("toggleAimer", false)
	if asteroid == null:
		push_warning("Flinge.stopFlinging called but there was no asteroid")
		return
	else:
		var mousePos : Vector2 = get_viewport().get_mouse_position()
		var diffVec : Vector2 = asteroid.position - mousePos
		asteroid.onFling(diffVec.length(), diffVec.normalized())
		asteroid.disconnect("asteroidKillingItself", self, "_on_asteroidKillingItself")
		asteroid = null
	

func _on_asteroidKillingItself(_asteroid):
	if asteroid != null and asteroid == _asteroid:
		asteroid = null




