class_name GroundState
extends State

@onready var actor:Player = $"../.."

func PhysicsUpdate(delta:float) -> void:
	var dir := Input.get_vector("left","right","forward","backward")
	if Input.is_action_just_pressed("forward"):
		print(actor.basis)
	actor.movePlayer(actor.basis * Vector3(dir.x, 0.0 , dir.y))
	if Input.is_action_just_pressed("forward"):
		print(actor.basis)
