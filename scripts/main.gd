extends Node2D

@onready var bg = $Background/Bg
@onready var asteroid = $asteroid
@onready var player = $Player
@onready var timer = $Timer
@onready var particles = $Particles

func backdrop():
	var layers = bg.get_children()
	for i in layers:
		i.hide()
	layers[Global.layer_index].show()
		
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.score = 0
	Global.gameOver = false
	Global.scrolling_speed = 1
	backdrop()

func _process(_delta):
	# Manages a parallax background, adding depth through layers
	bg.motion_offset.x = bg.get_motion_offset().x - Global.scrolling_speed
	
	if timer.is_stopped():
		Global.score += int(5*Global.scrolling_speed)
		timer.start()

	if Global.gameOver:
		get_tree().change_scene_to_file("res://scenes/death.tscn")

	debris()
	
func debris():
	particles.position.y = asteroid.position.y
	if asteroid.position.x < -45:
		particles.emitting = false
	else:
		particles.emitting = true
	
