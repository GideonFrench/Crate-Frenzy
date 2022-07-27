extends Node

var mouse
var crate
var level_id = 1

func change_scene(id):
	get_tree().change_scene("res://Scenes/Scene"+str(id)+".tscn")
	level_id = level_id + 1

func _ready():
	level_id = 1

#func _process(delta):
#	pass
