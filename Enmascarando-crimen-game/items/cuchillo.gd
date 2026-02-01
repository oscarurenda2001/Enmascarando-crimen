extends GeneralObject

func interact(obj):
	if(obj == self):
		#GameManager.add_game_score(puntuacion)
		print(ObjName)
		queue_free()
	
func _input_event():
		GameManager.add_game_score(puntuacion)
		queue_free()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
