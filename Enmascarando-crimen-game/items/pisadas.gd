extends Node3D
@export var puntuacion: int = 5
@export var sprite: Node
var is_colected: bool = false

func interact():
	if(is_colected):
		return
	is_colected = true
	emit_signal("Puntuacion",puntuacion)
	
func _input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton \
	and event.pressed \
	and event.button_index == MOUSE_BUTTON_LEFT:
		GameManager.add_game_score(puntuacion)
		queue_free()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
