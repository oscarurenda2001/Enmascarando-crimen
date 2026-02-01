extends Node


signal min_level_score(score)
signal change_score(score)
signal time_changed(time_left)
signal level_won
signal level_lost
signal open_report(caseNode: Node2D)
signal close_report(caseNode: Node2D)
const SCENE_FINISH = "res://scenes/SceneFinish/EsceneFinish.tscn"
@onready var police = $police
var current_score: int = 0
@export var time_left: int = 10
@export var max_time: int = 10
var is_playing: bool = false
var exit: bool = false
var win: bool = false
var min_score: int = 100
var finalScore: int = 0
var lvl = 1
var lastLvl = 2
var isReport = false

func get_current_scene():
	return get_tree().current_scene
	
func start_level() -> void:
	current_score = 0
	GameManager.min_score = min_score
	time_left = max_time
	exit =false
	win = false
	is_playing = true


func add_game_score(score: int) -> void:
	if not is_playing:
		return
	current_score += score
	emit_signal("change_score", current_score)

func end_game() -> void:
	print("en game manager exit es:",exit)
	if not is_playing:
		return 
	
	if exit or time_left <= 0:
		is_playing = false
		
	GameManager.finalScore = current_score
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file(SCENE_FINISH)
	
		
func showMessageItem(msg: String, actions: Array[Dictionary]) -> void:
	get_tree().current_scene.find_child("ItemAction").set_actions(msg, actions)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("report"):
		if isReport:
			isReport = !isReport
			close_report.emit(get_tree().current_scene.find_child("Cliente"))
		else:
			isReport = !isReport
			open_report.emit(get_tree().current_scene.find_child("Cliente"))
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_playing :
		return
	if exit: 
		end_game()

func _on_timer_timeout() -> void:
	if time_left > 0:
		time_left = time_left -1
	if time_left<= 0:
		police.stop()
		end_game()
	if time_left < 10 and !police.playing:
		police.play()
	
	time_changed.emit(time_left)
