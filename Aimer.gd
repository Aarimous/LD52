extends Node2D

var lineGrowthScale = 150
var gapScale = 2

func _ready():
	disable()
	SignalBus.connect("toggleAimer", self, "_on_toggleAimer")
	
func _on_toggleAimer(value):
	if value == true:
		enable()
	else:
		disable()

func enable(): 
	visible = true
	set_process(true)
	
func disable():
	visible = false
	set_process(false)

func _process(delta):
	if Flinger.asteroid != null:
		global_position = Flinger.asteroid.global_position
	updateAimingLineSpacing()
		
func updateAimingLineSpacing():
	var diffRot = global_position.angle_to_point(get_viewport().get_mouse_position())
	var diffVec = global_position - get_viewport().get_mouse_position()
	var diffVecMagnitude = diffVec.length()
	var gapVec = diffVec / get_child_count() * gapScale 
	var currentStartPoint = Vector2.ZERO
	for line in get_children():
		line.scale.x = diffVecMagnitude / lineGrowthScale
		line.rotation = diffRot
		line.global_position = global_position + currentStartPoint
		currentStartPoint += gapVec
		
