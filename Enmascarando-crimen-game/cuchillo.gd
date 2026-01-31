extends Node3D
@export var puntuacion: int = 10
@export var sprite: Node
var is_colected: bool = false

func interact():
	if(is_colected):
		return
	is_colected = true
	emit_signal("Puntuacion",puntuacion)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_click(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	print("cuchi")
