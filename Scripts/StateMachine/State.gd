extends Node
class_name State

signal transition(newStateName: StringName)

func Enter() -> void:
	pass

func Exit() -> void:
	pass

func Update(delta: float) -> void:
	pass

func PhysicsUpdate(delta: float) -> void:
	pass
