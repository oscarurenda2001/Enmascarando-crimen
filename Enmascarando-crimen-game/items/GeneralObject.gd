@abstract
class_name GeneralObject
extends Node3D
@export var puntuacion: int = 10
var objName: String = "General Object"
var msg: String
var actions: Array[Dictionary]
var enable: bool = true

func set_variables(objName: String, puntuacion: int, msg: String, actions: Array[Dictionary]) -> void:
	self.objName = objName
	self.puntuacion = puntuacion
	self.msg = msg
	self.actions = actions

func interact(obj):
	if(obj == self && enable):
		GameManager.showMessageItem(msg, actions)
		print("name: ", objName)
	
func _on_disapear():
	GameManager.add_game_score(puntuacion)
	print(objName)
	if(objName == "Sangre" or objName == "Pisadas"):
		var tween = get_tree().create_tween()
		tween.set_parallel(false)
		print(self)
		tween.tween_property(self, "scale", Vector3(0,0,0), 1)
		await tween.finished
		queue_free()
	else:
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
