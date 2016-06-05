
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	add_to_group("candy")
	get_node("Area2D").connect("body_enter",self,"cambiar_nivel")
	
func cambiar_nivel(body):
	##Guarda los puntos para el siguiente nivel
	var points = get_parent().points
	var global_points = get_node("/root/global").get("global_score")
	get_node("/root/global").set("global_score", global_points + points)
	print(points + global_points)
	## Nos vamos al siguiente nivel
	var next_level = get_parent().next_level
	get_node("/root/global").goto_scene(next_level)


