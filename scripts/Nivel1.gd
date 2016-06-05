
extends Node2D

var points = 0
var score  = 0
var next_level = "res://levels/Nivel2.xscn"

func _ready():
	score  = get_node("Canvas/Score")
	points = get_node("/root/global").get("global_score")
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	score.set_text("Score: " + str(points))
