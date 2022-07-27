extends Node2D

onready var collision = get_node("Collision")

func _ready():
	GameManager.mouse = self
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	self.position = get_viewport().get_mouse_position()
	if collision.overlaps_body(GameManager.crate) and Input.is_action_pressed("click"):
		GameManager.crate.carried = true
	else:
		GameManager.crate.carried = false
	
