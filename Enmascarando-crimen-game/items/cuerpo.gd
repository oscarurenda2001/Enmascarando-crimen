extends GeneralObject
@export var sprite: Node
@export var move: float
@export var damage: float
@export var no: float

signal disapear()
signal damage_body()
signal nothing()

func _init() -> void:
	set_variables("Cuerpo", puntuacion, "¿Qué quieres hacer con el cuerpo?\nPulsa el número correspondiente.", [{"text": "1 - Mover", "keyButton": "first", "sig": disapear}, {"text": "2 - Dañar", "keyButton": "second", "sig": damage_body}, {"text": "3 - Nada", "keyButton": "third", "sig": nothing}])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_disapear():
	GameManager.add_game_score(puntuacion*move)
	queue_free()
	enable = false

func _on_damage_body() -> void:
	GameManager.add_game_score(puntuacion*damage)
	$Cuerpo_Scene/MeshInstance3D.visible = true
	enable = false
	
func _on_nothing() -> void:
	GameManager.add_game_score(puntuacion*no)
	enable = false
