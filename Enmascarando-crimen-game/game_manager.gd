extends Node
signal min_level_score(score)
signal change_score(score)
signal time_changed(time_left)
signal level_won
signal level_lost

var current_score: int = 0
var time_left: float
var max_time: float = 180.0
var is_playing: bool = false
var exit: bool = false
var win: bool = false
var min_score: int = 50

func start_level() -> void:
	current_score = 0
	time_left = max_time
	exit = false
	win = false
	is_playing = true
	
	emit_signal("change_score", current_score)
	emit_signal("time_changed", time_left)
	emit_signal("min_level_score", min_score)

func add_game_score(score: int) -> void:
	if not is_playing:
		return
	current_score += score
	emit_signal("change_score", current_score)

func end_game() -> void:
	if not is_playing:
		return 

	if exit or time_left <= 0:
		is_playing = false
		if current_score >= min_score:
			win = true
			emit_signal("level_won")
		else:
			win = false
			emit_signal("level_lost")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_playing:
		return
	
	#AÑADIR TIMER
	
	emit_signal("time_changed", time_left)
	
	end_game()
