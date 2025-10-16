extends CharacterBody3D


@export_range(0.0, 300.0) var SPEED : float
@export_range(0.0,10.0) var ROT_SPEED : float

#@export var DebugCamera : Camera3D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var walk = Input.get_axis("up", "down")
	var rot = Input.get_axis("right", "left")
	var direction := transform.basis * Vector3(0, 0, walk)
	
	if direction:
		#It's important to keep x axis even if the z axis is the only axis that is modified, because it wouldn't be able to move in any other directions other than it's z axis??
		velocity.x = direction.x * SPEED * delta
		velocity.z = direction.z * SPEED * delta
		#print(DebugCamera.position)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if rot:
		rotate_object_local(Vector3(0,1,0), rot * ROT_SPEED * delta)
		#print(DebugCamera.rotation_degrees)
	else:
		rotate_object_local(Vector3(0,1,0), 0)

	move_and_slide()
