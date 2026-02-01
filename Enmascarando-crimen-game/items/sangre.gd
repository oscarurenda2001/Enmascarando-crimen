extends GeneralObject
@export var sprite: Node
var tween: Tween

signal clean()

func _init() -> void:
	set_variables("Sangre", puntuacion, "Mantén presionado el click izquierdo para limpiar la sangre.", [{"text": "", "keyButton": "click", "sig": clean}])
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if tween && !Input.is_action_pressed("click"):
		tween.pause()


func _on_clean() -> void:
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector3(0,0,0), 3)
	await tween.finished
	delete_object()
