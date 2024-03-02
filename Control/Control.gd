extends Control

@onready var Stop = $Stop

func _ready():
	_on_stop_pressed()

func _physics_process(delta):
	if Input.is_action_just_pressed("Esc"):
		_on_stop_pressed()
	
	if $Difficulty/Simple.button_pressed:
		get_parent().BlockNum = 1
		if int($Max/Simple.text) < int($Num/Num.text):
			$Max/Simple.text = $Num/Num.text
	elif $Difficulty/Medium.button_pressed:
		get_parent().BlockNum = 2
		if int($Max/Medium.text) < int($Num/Num.text):
			$Max/Medium.text = $Num/Num.text
	elif $Difficulty/Difficulty.button_pressed:
		get_parent().BlockNum = 3
		if int($Max/Difficulty.text) < int($Num/Num.text):
			$Max/Difficulty.text = $Num/Num.text

func _on_stop_pressed():
	if Stop.visible:
		Stop.visible = false
		Input.mouse_mode = 2
		get_tree().paused = false
	else:
		Stop.visible = true
		Input.mouse_mode = 0
		get_tree().paused = true


func _on_simple_pressed():
	Resetting()

func _on_medium_pressed():
	Resetting()

func _on_difficulty_pressed():
	Resetting()



func Resetting():
	get_parent().get_node("Piping/Animation").stop()
	get_parent().get_node("Piping/Animation").play("Play")
	
	get_parent().get_node("Player").position = Vector3.ZERO
	get_parent().get_node("Player").rotation = Vector3.ZERO
	get_parent().get_node("Player").Head.rotation = Vector3(deg_to_rad(-90), 0, 0)
	
	get_parent().speed = 1
	get_parent().delta_time = 0.0
	get_parent().Save()
	_on_stop_pressed()


