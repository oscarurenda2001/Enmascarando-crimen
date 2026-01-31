extends Node3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _start_animation():
	animation_player.play("arms_armature|Relax_hands_idle_start")
	animation_player.play("arms_armature|Relax_hands_idle")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start_animation()
	 # Replace with function body.

func _pick_something():
	animation_player.play("arms_armature|Collect_something")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
