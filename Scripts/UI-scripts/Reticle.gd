extends CenterContainer

@onready var player = $"../.."

@export var dotRadius := 2.0
@export var reticleDefaultRadius := 1.0
@export var reticleExpandedRadius := 12.0

var reticleRadius := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	reticleRadius = reticleDefaultRadius

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()

func _draw():
#	if player.velocity == Vector3.ZERO:
#		reticleRadius = lerp(reticleRadius,reticleDefaultRadius, get_process_delta_time()*10)
#	else:
#		reticleRadius = lerp(reticleRadius,reticleExpandedRadius, get_process_delta_time()*10)
	draw_arc(Vector2(0,0), reticleRadius, 0, rad_to_deg(360), 16, Color.WHITE, 1, true)
