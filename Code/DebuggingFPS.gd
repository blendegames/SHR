extends Node3D

const TIMER_LIMIT = 1.0
var timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer > TIMER_LIMIT:
		print(str(Engine.get_frames_per_second()))
		timer = 0.0
