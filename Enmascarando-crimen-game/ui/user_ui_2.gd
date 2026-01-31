extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func game_over():
	print("Has perdido")


func _on_game_manager_time_changed(time_left: Variant) -> void:
	$TextureRect/Label_tiempo.text = str(time_left)
