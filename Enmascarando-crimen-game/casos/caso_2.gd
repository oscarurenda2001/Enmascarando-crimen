extends Node2D

func make_visible() -> void:
	visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 1, 1)
	await tween.finished
	
func make_invisible() -> void:
	visible = false
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0, 1)
	await tween.finished
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
