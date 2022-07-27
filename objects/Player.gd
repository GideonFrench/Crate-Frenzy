extends KinematicBody2D


var vel : Vector2 = Vector2()
var rspeed : int = 0
var lspeed : int = 0
var cutoff : int =  30
var friction : int = 20
var max_speed : int = 550
var speed : int = 150
var gravity : int = 2000
var jump_force : int = 800

onready var isprite : Sprite = get_node("Idle")

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("move_left"):
		lspeed = -speed
		isprite.flip_h = true
	else:
		lspeed = 0
		
	if Input.is_action_pressed("move_right"):
		rspeed = speed
		isprite.flip_h = false
	else:
		rspeed = 0
		
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jump_force
		
	if vel.x < max_speed and vel.x > -max_speed:
		vel.x += rspeed + lspeed
		
	vel.y += gravity * delta
	
	if vel.x > friction:
		vel.x -= friction
	if vel.x < -friction:
		vel.x += friction
		
	if vel.x < cutoff and vel.x > -cutoff:
		vel.x = 0;
		
	vel = move_and_slide(vel, Vector2.UP)
