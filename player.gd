extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = Vector3(input_dir.x, 0, input_dir.y)
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()
