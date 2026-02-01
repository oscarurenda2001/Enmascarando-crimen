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
		#print("name: ", objName)
	
func delete_object():
	GameManager.add_game_score(puntuacion)
	print(objName)
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
