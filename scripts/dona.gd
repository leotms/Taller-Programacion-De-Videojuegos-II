
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	add_to_group("dona")
	get_node("Area2D").connect("body_enter",self,"subir_puntos")
	
func subir_puntos(body):
	var points = get_parent().points + 100
	get_parent().set("points",points)
	queue_free()