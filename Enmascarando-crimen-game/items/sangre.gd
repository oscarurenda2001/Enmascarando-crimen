extends GeneralObject
@export var sprite: Node

signal disapear()

func _init() -> void:
	set_variables("Sangre", puntuacion, "¿Qué quieres hacer con la sangre?\nPulsa el número correspondiente.", [{"text": "1 - Limpiar sangre", "keyButton": "first", "sig": disapear}])
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
