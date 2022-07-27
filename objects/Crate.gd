extends KinematicBody2D

var carried : bool = false
var gravity : int = 2000
var vel : Vector2 = Vector2()
var speed : int = 0
var speed_mult = 100
var max_speed = 1000

func _ready():
	GameManager.crate = self
	carried = false

func _process(delta):
	if carried:
		speed = self.position.distance_to(get_viewport().get_mouse_position()) * speed_mult
		vel = self.position.direction_to(get_viewport().get_mouse_position()) * speed
	else:
		vel.y += gravity * delta
		
	if is_on_floor() and carried == false:
		vel.x = 0
		vel.y = 0
		
	if self.position.distance_to(get_viewport().get_mouse_position()) < 5 and carried:
		vel.x = 0
		vel.y = 0
		
	vel = move_and_slide(vel, Vector2.UP)
