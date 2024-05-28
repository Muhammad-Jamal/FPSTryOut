class_name GroundState
extends State

#@onready var actor:Player = $"../.."
func Enter():
	actor = owner

func PhysicsUpdate(delta:float) -> void:
	if actor.is_on_floor() and actor.inputHandler.getJumpPressed():
		handleJump()
	moveActor()
	if not actor.is_on_floor():
		transition.emit("AirState")

	

func moveActor() -> void:
	var inputDirection = actor.inputHandler.getInputDirection()
	var moveDirection = actor.basis * Vector3(inputDirection.x, 0.0 , inputDirection.y)
	actor.movePlayer(moveDirection)

func handleJump() -> void:
	actor.velocity.y = actor.JUMP_VELOCITY
