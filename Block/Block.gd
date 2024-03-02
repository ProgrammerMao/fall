extends StaticBody3D

@export var BlockNum = 1

@onready var BlockNum1 = $"1"
@onready var BlockNum2 = $"2"
@onready var BlockNum3 = $"3"

var regular = true

func _ready():
	move()

func _physics_process(delta):
	BlockNum = get_parent().get_parent().get_parent().BlockNum
	if global_position.y < -10:
		move()
		regular = false
	else:
		regular = true
	
	if BlockNum == 1:
		BlockNum2.visible = false
		BlockNum2.disabled = true
		BlockNum3.visible = false
		BlockNum3.disabled = true
	elif BlockNum == 2:
		BlockNum2.visible = true
		BlockNum2.disabled = false
		BlockNum3.visible = false
		BlockNum3.disabled = true
	elif BlockNum == 3:
		BlockNum2.visible = true
		BlockNum2.disabled = false
		BlockNum3.visible = true
		BlockNum3.disabled = false

func move():
	var rng = RandomNumberGenerator.new()
	BlockNum1.position.x = rng.randf_range(-0.375, 0.375)
	BlockNum1.position.z = rng.randf_range(-0.375, 0.375)
	BlockNum1.rotation.y = rng.randf_range(0, 180)
	
	BlockNum2.position.x = rng.randf_range(-0.375, 0.375)
	BlockNum2.position.z = rng.randf_range(-0.375, 0.375)
	BlockNum2.rotation.y = rng.randf_range(0, 180)
	
	BlockNum3.position.x = rng.randf_range(-0.375, 0.375)
	BlockNum3.position.z = rng.randf_range(-0.375, 0.375)
	BlockNum3.rotation.y = rng.randf_range(0, 180)
