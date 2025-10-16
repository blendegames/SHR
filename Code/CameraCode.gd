extends Camera3D

@export var PlayerBody : CharacterBody3D
@export_range(1.0,10.0) var radius : float
@export_range(1.0,20.0) var speed : float

const ZoffsetMax = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_rotation.y = PlayerBody.global_rotation.y
	global_rotation.x = PlayerBody.global_rotation.x - deg_to_rad(17.0)
	global_rotation.z = PlayerBody.global_rotation.z
	
	var position_cam_x = radius * sin(PlayerBody.rotation.y)
	var position_cam_z = radius * cos(PlayerBody.rotation.y)
	
	#global_position.y = PlayerBody.global_position.y + 1.0
	#global_position.x = PlayerBody.global_position.x + position_cam_x
	#global_position.z = PlayerBody.global_position.z + position_cam_z
	global_position = global_position.lerp(Vector3(PlayerBody.global_position.x + position_cam_x, PlayerBody.global_position.y + 2.0, PlayerBody.global_position.z + position_cam_z), delta * speed)
