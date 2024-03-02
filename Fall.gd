extends Node3D

@export var BlockNum = 1

var data = {
	"Simple" : 0.0,
	"Medium" : 0.0, 
	"Difficulty" : 0.0
}


var delta_time = 0.0

var speed = 1

var pitch = 1

func _ready():
	Load()

func _physics_process(delta):
	$Music.pitch_scale = pitch
	
	pitch += delta / 1000
	
	speed += delta / 10
	$Piping/Animation.speed_scale = speed
	
	delta_time += delta
	$Control/Num/Num.text = str(int(delta_time * 5 * speed))
	
	$Control/Speed/Speed.text = str(float(int(speed * 100))/100)
	
	if not $Music.playing:
		$Music.playing = true

func Save():
	data.Simple = int($Control/Max/Simple.text)
	data.Medium = int($Control/Max/Medium.text)
	data.Difficulty = int($Control/Max/Difficulty.text)
	
	var file = FileAccess.open("data.json",FileAccess.WRITE)
	file.store_line(JSON.stringify(data))
	file.close()

func Load():
	var file = FileAccess.open("data.json",FileAccess.READ)
	if FileAccess.get_open_error():
		Save()
	else:
		var json_object = JSON.new()
		var result = json_object.parse(file.get_as_text())
		data = json_object.data
		file.close()
	
	$Control/Max/Simple.text = str(data.Simple)
	$Control/Max/Medium.text = str(data.Medium)
	$Control/Max/Difficulty.text = str(data.Difficulty)

func Fail():
	$Control/Fail.playing = true
	$Music.playing = false
	pitch = 1
	$Control.Resetting()
	


