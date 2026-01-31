extends Camera3D

@export var follow_target: Node3D
@export var ray_length: float = 100.0  # distancia del raycast
var items = ['StaticCuerpo','StaticSangre','StaticCuchillo','StaticPisada']

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
			print(result)
			print(collider.get_parent().get_parent())
			var obj = collider.get_parent().get_parent()
			obj.interact(obj)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:

	global_position = follow_target.global_position + Vector3(0, 30, 0)
