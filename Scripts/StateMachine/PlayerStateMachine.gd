extends Node

@export var currentState:State
var states:Dictionary = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
		else:
			print("Player State Machine: Incompatible Child Node")
	currentState.Enter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentState.Update(delta)
	
func _physics_process(delta: float) -> void:
	currentState.PhysicsUpdate(delta)

func OnStateTransition(newStateName: StringName):
	var newState:State = states.get(newStateName)
	if (newState != null) && (newState == currentState):
		currentState.Exit()
		newState.Enter()
		currentState = newState
	else:
		print("Player State Machine: New State Error")
		
