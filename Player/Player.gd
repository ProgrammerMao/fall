extends CharacterBody3D

const SPEED = 2.5

@export var NotCollision = true

@onready var Head = $Camera

func _input(event):
	if event is InputEventMouseMotion:
		rotate_object_local(Vector3.UP, deg_to_rad(-event.relative.x * 0.075))
		Head.rotation.x -= deg_to_rad(event.relative.y * 0.075)
		Head.rotation.x = clamp(Head.rotation.x,deg_to_rad(-90),deg_to_rad(-60))

func _physics_process(delta):
	$Collision.disabled = NotCollision
	
	var input_dir = Input.get_vector("A", "D", "W", "S")
	var direction = transform.basis * Vector3(input_dir.x, 0, input_dir.y)
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	
	if is_on_floor():
		get_parent().Fail()
