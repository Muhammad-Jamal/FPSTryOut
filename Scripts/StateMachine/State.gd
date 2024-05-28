class_name State 
extends Node

signal transition(nextState: String)
var actor:CharacterBody3D

func Enter() -> void:
	actor = owner
	
func Exit() -> void:
	pass

func Update(delta:float) -> void:
	pass

func PhysicsUpdate(delta:float) -> void:
	pass

