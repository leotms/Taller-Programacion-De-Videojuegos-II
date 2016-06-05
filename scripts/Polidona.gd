
extends KinematicBody2D

const MAX_TIME = 3
const SPEED = 2
var time = 0
var vector_right = Vector2(1,0)
var vector_left  = Vector2(-1,0)
var cuerpo

func _ready():
	add_to_group("enemigos")
	cuerpo = get_node("Cuerpo")
	get_node("Animacion").play("Walk")
	#Para matar a RALPH
	
	get_node("Area2D").connect("body_enter",self,"_kill_player")
	set_fixed_process(true)
	
func _kill_player(body):
	get_parent().get_node("Ralph").queue_free()

func _fixed_process(delta):
	
	time += delta
	
	if time < 1.5:
		cuerpo.set_flip_h(false)
		move(vector_right*SPEED)
	elif time > 1.5 and time < MAX_TIME:
		cuerpo.set_flip_h(true)
		move(vector_left*SPEED)
	elif time > 3:
		time = 0
	
	
	
	
	

