extends Node


signal min_level_score(score)
signal change_score(score)
signal time_changed(time_left)
signal level_won
signal level_lost
const SCENE_FINISH = "res://escenas/SceneFinish/EsceneFinish.tscn"
var scene_finish_instance = preload(SCENE_FINISH).instantiate()

var current_score: int = 0
var time_left: int = 40
var max_time: int = 40
var is_playing: bool = false
var exit: bool = false
var win: bool = false
var min_score: int = 100
var finalScore: int = 0



func start_level() -> void:
	current_score = 200
	GameManager.min_score = min_score
	time_left = max_time
	exit = false
	win = false
	is_playing = true


func add_game_score(score: int) -> void:
	if not is_playing:
		return
	current_score += score
	emit_signal("change_score", current_score)

func end_game() -> void:
	if not is_playing:
		return 
		
	GameManager.finalScore = current_score
	get_tree().change_scene_to_file(SCENE_FINISH)
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

func _on_timer_timeout() -> void:
	print('entra')
	if time_left > 0:
		time_left = time_left -1
	if time_left<= 0:
		end_game()
	
	time_changed.emit(time_left)
