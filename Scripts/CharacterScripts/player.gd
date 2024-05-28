extends CharacterBody3D
class_name Player

const JUMP_VELOCITY = 6.5


@export var inputHandler:InputHandler
@export var camera_holder:Node3D
@export var animation_player:AnimationPlayer
@export var head_collision_check:ShapeCast3D

@export var hRotationSpeed:float = 10.0
@export var vRotationSpeed:float = 10.0
@export var accelaration:float = 0.1
@export var deccelaration:float = 0.2

var platformSpeed:Vector3 = Vector3.ZERO
var isCrouching:bool = false
var gravity:float = 9.8
var speed := 5.0

func _ready():
	Globals.player = self
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotateCamera(event.relative.y)
		rotatePlayerHorizontallyWithMouse(event.relative.x)
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func movePlayer(direction:Vector3):
	velocity.x = platformSpeed.x + lerp(velocity.x, direction.x * speed, accelaration )
	velocity.z = platformSpeed.z + lerp(velocity.z, direction.z * speed, accelaration )
	move_and_slide()

func applyGravity():
	var velocityY = velocity.y
	velocity.y -= gravity * get_process_delta_time()
	#velocity.y = velocityY #move_toward(velocity.y, velocityY , gravity * get_process_delta_time() )
	print(velocity)
	move_and_slide()

#always rotate on both H/V with mouse
func rotatePlayerHorizontallyWithMouse(rotationX:float):
	rotation_degrees.y -= rotationX  * get_process_delta_time() * hRotationSpeed

func rotateCamera(rotationY:float) -> void:
	var vertDirection = camera_holder.rotation_degrees.x
	vertDirection -= rotationY * get_process_delta_time() * vRotationSpeed
	camera_holder.rotation_degrees.x = clampf(vertDirection,-89 , 89)
