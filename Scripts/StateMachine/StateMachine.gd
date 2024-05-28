class_name StateMachine 
extends Node

@export var currentState:State
@export var states:Dictionary = {}

func _ready():
	var childs:= get_children()
	if childs:
		for child in childs:
			if child is State:
				states[child.name] = child
				child.transition.connect(TransitionTo)
			else:
				print("Child not a state")
	currentState = states["GroundState"]
	currentState.Enter()
	
func _physics_process(delta):
	currentState.PhysicsUpdate(delta)

func TransitionTo(nextStateName:String):
	var nextState:State = states[nextStateName]
	if nextState != currentState and nextState != null:
		currentState.Exit()
		nextState.Enter()
		currentState = nextState
		print(nextState.name)
	else:
		print("Next State null or same")
