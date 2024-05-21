extends CharacterBody3D
class_name Player

const JUMP_VELOCITY = 4.5
#abc
@onready var camera_holder = $CameraHolder
@onready var animation_player = $AnimationPlayer
@onready var head_collision_check = $HeadCollisionCheck

@export var hRotationSpeed:float = 10.0
@export var vRotationSpeed:float = 10.0

var isCrouching:bool = false
var gravity:float = 9.8
var playerMoveSpeed := 5.0


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Globals.debug.AddProperty("Velocity", playerMoveSpeed)

func _input(event):
	if event.is_action_pressed("crouch"):
		crouch()
	
	if event is InputEventMouseMotion:
		rotateCamera(event)
		rotatePlayerHorizontallyWithMouse(event)
		
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * playerMoveSpeed
		velocity.z = direction.z * playerMoveSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, playerMoveSpeed)
		velocity.z = move_toward(velocity.z, 0, playerMoveSpeed)
	Globals.debug.UpdateProperty("Velocity", playerMoveSpeed)
	move_and_slide()


#----------------- Custom methods -------------

func crouch()-> void:
	if isCrouching:
		# uncrouch section
		if(head_collision_check.is_colliding() == false):
			animation_player.play("crouch", -1 , -4 , true)
			isCrouching = false
			playerMoveSpeed = 5.0
	else:
		#crouch section
		animation_player.play("crouch", -1 , 4)
		isCrouching = true
		playerMoveSpeed = 2.0

func rotatePlayerHorizontallyWithMouse(event:InputEvent):
	rotation_degrees.y -= event.relative.x  * get_process_delta_time() * hRotationSpeed

func rotateCamera(event:InputEvent) -> void:
	var vertDirection = camera_holder.rotation_degrees.x
	vertDirection -= event.relative.y * get_process_delta_time() * vRotationSpeed
	camera_holder.rotation_degrees.x = clampf(vertDirection,-89 , 89)
