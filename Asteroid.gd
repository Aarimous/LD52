extends Area2D
class_name Asteroid

var direction : Vector2 = Vector2.ZERO
var speed : float = 0.0
var velocity : Vector2 = speed * direction

func _process(delta):
	position += velocity * delta
	speed = max(0.0, speed - Game.ASTEROID_FRICTION * delta)
	velocity = speed * direction

func _ready():
	print("Asteroid on ready")

func _on_Asteroid_mouse_entered():
	print("_on_Asteroid_mouse_entered")


func _on_Asteroid_mouse_exited():
	print("_on_Asteroid_mouse_exited")
	

func setSpeed(_speed):
	speed = _speed
	velocity = speed * direction
	
func setDirection(_direction):
	direction = _direction
	velocity = speed * direction
	
	

func _on_Asteroid_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed() == true:
				var pos = global_position
				get_parent().remove_child(self)
				Game.main.add_child(self)
				position = pos
				Flinger.startFlinging(self)
				print("Mouse Button Click")


func _on_Asteroid_area_entered(area):
	if area.is_in_group("Sun"):
		kill()
	elif area.is_in_group("Planet"):
		kill()

func kill():
	queue_free()
