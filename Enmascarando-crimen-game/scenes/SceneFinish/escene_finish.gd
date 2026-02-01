extends CanvasLayer

const PRUEBA = "res://prueba.tscn"

var level_completed = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setLabelsResult(GameManager.finalScore)
	if GameManager.lvl:
		$VBoxContainer/Button.visible = level_completed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setLabelsResult(result):
	print(GameManager.exit)
	if GameManager.exit:
		if result < GameManager.min_score:
			level_completed = false
			$VBoxContainer/LevelResultTitle.text = "Hay demasiadas evidencias, han atrapado al cliente"
		if result >= GameManager.min_score:
			level_completed = true
			$VBoxContainer/LevelResultTitle.text = "Has conseguido enmascarar las pruebas a tiempo"
		$VBoxContainer/MinPointLabel.text = "Puntuación minima: " + str(GameManager.min_score)
		$VBoxContainer/Result.text = "Puntuación: " +str(result)
	else:
		level_completed = false
		$VBoxContainer/LevelResultTitle.text = "No has conseguido enmascarar las pruebas a tiempo"


func _on_repeat_level_button_button_down() -> void:
	get_tree().change_scene_to_file(PRUEBA)
