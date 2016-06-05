
extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_node("/root/global").retry();
	elif Input.is_action_pressed("ui_cancel"):
		get_tree().quit();

