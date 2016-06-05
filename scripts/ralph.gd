
extends KinematicBody2D
 
const GRAVITY    =  250.0
const SPEED      =  2
const JUMP       =  250

var velocity     = Vector2()
var vector_right = Vector2(1,0)
var vector_left  = Vector2(-1,0)
var vector_up    = Vector2(0,-1)

var cuerpo
var animacion
var en_suelo = false

func _ready():
	cuerpo = get_node("Cuerpo")
	animacion = get_node("Animacion")
	set_fixed_process(true)
			
func _fixed_process(delta):
	
	#Para la gravedad de Ralph
	var force = Vector2(0,GRAVITY)
	
	if Input.is_action_pressed("ui_left"):
		if not(cuerpo.is_flipped_h()):
			cuerpo.set_flip_h(true)
		if animacion.get_current_animation() != "walk":
			animacion.play("walk")	
		
		move(vector_left*SPEED)
		
	elif Input.is_action_pressed("ui_right"):
		if (cuerpo.is_flipped_h()):
			cuerpo.set_flip_h(false)
		if animacion.get_current_animation() != "walk":
			animacion.play("walk")
			
		move(vector_right*SPEED)
		
	else:
		if animacion.get_current_animation() != "idle":
			animacion.play("idle")
			
	if Input.is_action_pressed("ui_up") and en_suelo: 	
		en_suelo = false
		velocity = vector_up*JUMP
			
	# Para la gravedad.
	velocity += force*delta
	# Integrate velocity into motion and move
	var motion = velocity*delta
	# Move and consume motion
	motion = move(motion)
			
	#Para detectar si estoy en el suelo
		
	if (is_colliding()):
		var object = get_collider()
		print(object.get_name())
		if object.is_in_group("plataforma"):
			en_suelo = true