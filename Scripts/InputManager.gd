class_name InputHandler
extends Node

var inputDirection:Vector2
var isJumpPressed:bool = false
var isSprintPressed:bool = false
var isCrouchPressed:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	inputDirection = Input.get_vector("left","right","forward","backward")
	isSprintPressed = Input.is_action_pressed("sprint")
	isJumpPressed = Input.is_action_just_pressed("jump")
	isCrouchPressed = Input.is_action_just_pressed("crouch")
	
func getInputDirection() -> Vector2:
	return inputDirection

func getJumpPressed() -> bool:
	return isJumpPressed

func getCrouchPressed() -> bool:
	return isCrouchPressed

func getSprintPressed() -> bool:
	return isSprintPressed
