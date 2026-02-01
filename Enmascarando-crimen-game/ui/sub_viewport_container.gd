extends SubViewportContainer

func fade_in(caseNode: Node2D) -> void:
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self,"position",Vector2(327.0, 75.0), 1)
	tween.tween_property(self,"scale",Vector2(1,1), 1)
	tween.set_parallel(false)
	tween.tween_property(self, "modulate:a", 0, 1)
	await tween.finished
	caseNode.make_visible()


func fade_out(caseNode: Node2D) -> void:
	caseNode.make_invisible()
	var tween = get_tree().create_tween()
	tween.set_parallel(false)
	tween.tween_property(self, "modulate:a", 1, 1)
	tween.set_parallel(true)
	tween.tween_property(self,"position",Vector2(1020.0, 4.0), 1)
	tween.tween_property(self,"scale",Vector2(0.25,0.25), 1)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
