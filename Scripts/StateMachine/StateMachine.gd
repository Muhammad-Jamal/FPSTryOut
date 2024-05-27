class_name StateMachine 
extends Node

@export var currentState:State


func _physics_process(delta):
	currentState.PhysicsUpdate(delta)
