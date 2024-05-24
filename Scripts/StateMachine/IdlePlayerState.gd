class_name IdlePlayerState
extends State


# Called when the node enters the scene tree for the first time.
func Enter():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Update(delta):
	if Globals.player.velocity != Vector3.ZERO and get_parent().get_parent().is_on_floor():
		transition.emit("WalkingPlayerState")
