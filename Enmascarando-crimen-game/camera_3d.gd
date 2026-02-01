extends Camera3D

@export var follow_target: Node3D
@export var rayo: RayCast3D
@onready var grab = $"../grab"
# Called when the node enters the scene tree for the first time.
@export var ray_length: float = 100.0  # distancia del raycast
var items = ['StaticCuerpo','StaticSangre','StaticCuchillo','StaticPisada','StaticPuerta','StaticVeneno']

func check_if_object():
	var space_state = get_world_3d().direct_space_state
	var ray_params = PhysicsRayQueryParameters3D.new()
	ray_params.from = global_position
	ray_params.to = global_position + -global_transform.basis.z * ray_length
	ray_params.collision_mask = 1  
	var result = space_state.intersect_ray(ray_params)
	if result:
		var collider = result.collider
		if(result.collider.name in items):
			grab.play()
			var obj = collider.get_parent().get_parent()
			obj.interact(obj)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	set_up_camera()
	
func set_up_camera():
	var y_value = 0
	if GameManager.lvl == 1:
		y_value = 30
	if GameManager.lvl == 2:
		y_value = 30
		
	global_position = follow_target.global_position + Vector3(0, y_value, 0)	
