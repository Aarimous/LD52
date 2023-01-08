extends HBoxContainer

export(Array, Color) var colors 

var time = 0
var timeStringLong = ""
onready var timeValue = $"%TimeValue"

func _ready():
	time = Game.gameTimeLength
	SignalBus.connect("startGame", self, "_on_startGame")
	SignalBus.connect("gameOver", self, "_on_gameOver")
	set_process(false)
	
func _on_gameOver():
	set_process(false)

func _on_startGame():
	set_process(true)

func _process(delta):
	time -= delta
	var secs =  fmod(time, 60)
	var secStr = "%02d" % secs
	timeValue.text = str(secStr)
	
	if secs <= 0:
		Game.gameOver()
	if secs < 10:
		modulate = colors[2]
	elif secs < 20:	
		modulate = colors[1]
	else:
		modulate = colors[0]
	
	
