class_name AirState
extends State

func Enter():
	actor = owner

# Called when the node enters the scene tree for the first time.
func PhysicsUpdate(delta:float) -> void:
	if actor.is_on_floor():
		transition.emit("GroundState")
	else:
		actor.applyGravity()
