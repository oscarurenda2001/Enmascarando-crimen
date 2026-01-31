extends Camera3D

@export var follow_target: Node3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = follow_target.global_position + Vector3(0, 30, 0)
