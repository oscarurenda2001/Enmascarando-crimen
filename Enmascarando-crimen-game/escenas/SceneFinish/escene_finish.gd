extends CanvasLayer

const PRUEBA = "res://prueba.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_repeat_level_button_button_down() -> void:
	get_tree().change_scene_to_file(PRUEBA)
