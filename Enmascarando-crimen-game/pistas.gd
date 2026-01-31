extends Node3D

signal collected(points: int)  
@export var pista: Node3D
@export var puntuacion: int
@export var collision: CollisionObject3D
@export var tipo: String = "evidencia"
var is_collected: bool = false

func interact():
	if is_collected:
		return 

	is_collected = true
	emit_signal("collected", puntuacion)
	queue_free()  
