extends GeneralObject
@export var sprite: Node

signal disapear()

func _init() -> void:
	set_variables("Pisadas", puntuacion, "¿Qué quieres hacer con las pisadas?\nPulsa el número correspondiente.", [{"text": "1 - Limpiar", "keyButton": "first", "sig": disapear}])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
