extends CanvasLayer


@export var time_seconds = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_controller_timer_updated(seconds_left):
	$TextureRect/Label_tiempo.text = str(seconds_left)
	

func game_over():
	print("Has perdido")


func _on_timer_timeout() -> void:
	if time_seconds > 0:
		time_seconds = time_seconds -1
	if time_seconds <= 0:
		game_over()
	_on_game_controller_timer_updated(time_seconds)
