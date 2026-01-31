class_name Brazos
extends CharacterBody3D

@export var camera: Node3D
@export var arms : Brazos
@onready var footsteps = $footsteps

var count := 0
var yaw := 0.0
var pitch := 0.0
const PITCH_MIN := deg_to_rad(-60)
const PITCH_MAX := deg_to_rad(60)
const SENS := 0.01
const SPEED = 15.0
const JUMP_VELOCITY = 4.5

	
func _input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * SENS
		pitch -= event.relative.y * SENS
		pitch = clamp(pitch, PITCH_MIN, PITCH_MAX)
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	camera.rotation = Vector3(pitch, yaw, 0.0)
	#camera.global_position = Vector3(0, 30, 0)
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("palante"):
		if !footsteps.playing:
			footsteps.play()
		velocity.x = -sin(yaw) * SPEED
		velocity.z = -cos(yaw) * SPEED
		if count % 2 and is_on_floor():
			velocity.y = JUMP_VELOCITY
	elif Input.is_action_pressed("patras"):
		if !footsteps.playing:
			footsteps.play()
		velocity.x = sin(yaw) * SPEED
		velocity.z = cos(yaw) * SPEED
		if count % 2 and is_on_floor():
			velocity.y = JUMP_VELOCITY
	elif Input.is_action_pressed("pedroSanche"):
		if !footsteps.playing:
			footsteps.play()
		velocity.x = -cos(yaw) * SPEED
		velocity.z = sin(yaw) * SPEED
		if count % 2 and is_on_floor():
			velocity.y = JUMP_VELOCITY
	elif Input.is_action_pressed("Vox"):
		if !footsteps.playing:
			footsteps.play()
		velocity.x = cos(yaw) * SPEED
		velocity.z = -sin(yaw) * SPEED
		if count % 2 and is_on_floor():
			velocity.y = JUMP_VELOCITY
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		footsteps.stop()
	count += 1
	move_and_slide()
