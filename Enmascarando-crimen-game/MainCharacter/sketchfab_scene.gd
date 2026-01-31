extends Node3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var camera : Node3D
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
func _physics_process(delta: float) -> void:
	# Add the gravity.
	pass
	#if not get_parent().is_on_floor():
		#get_parent().velocity += get_parent().get_gravity() * delta
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
#
	#if Input.is_action_pressed("palante"):
		#get_parent().velocity.x = -sin(get_parent().yaw) * get_parent().SPEED
		#get_parent().velocity.z = -cos(get_parent().yaw) * get_parent().SPEED
		#if get_parent().count % 2 and get_parent().is_on_floor():
			#get_parent().velocity.y = get_parent().JUMP_VELOCITY
			#
	#else:
		#get_parent().velocity.x = move_toward(get_parent().velocity.x, 0, get_parent().SPEED)
		#get_parent().velocity.z = move_toward(get_parent().velocity.z, 0, get_parent().SPEED)
	#get_parent().count += 1
	#get_parent().move_and_slide()
