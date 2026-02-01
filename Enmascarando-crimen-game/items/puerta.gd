extends GeneralObject
@export var sprite: Node

signal exit()

func _init() -> void:
	set_variables("Puerta", 0, "¿Deseas salir?", [{"text": "1 - Sí", "keyButton": "first", "sig": exit}])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_exit():
	GameManager.exit = true
	print("print puerta")
