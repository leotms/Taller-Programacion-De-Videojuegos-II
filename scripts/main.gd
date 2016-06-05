
extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_node("/root/global").goto_scene("res://levels/Nivel1.xscn")
	elif Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


