extends Node2D

signal group_changed

var group : String = ""
var reference : Array = [
	[20000,"Herói"],
	[10000,"Guerreiro"],
	[5000, "Soldado"],
	[1000, "Aprendiz"],
	[100, "Iniciante"],
	[0, "Primitivo"]
]

@onready var animator = $Animator

func change_class(number : int) -> String:
	var old_group = group
	
	for i in reference:
		if number >= i[0]:
			group = i[1]
			break
	
	if old_group != group:
		emit_signal("group_changed")
	
	animator.play(group)
	return group

