class_name WalkingPlayerState
extends State

# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Update(delta):
	if Globals.player.velocity == Vector3.ZERO:
		transition.emit("IdlePlayerState")
