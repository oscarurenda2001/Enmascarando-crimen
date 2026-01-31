extends Camera3D

@export var follow_target: Node3D
@export var rayo: RayCast3D
@onready var grab = $"../grab"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = follow_target.global_position + Vector3(0, 30, 0)
	if Input.is_action_just_pressed("click"):
		if rayo.is_colliding():
			grab.play()
			var obj = rayo.get_collider()
			obj.clicked()
