extends Control

@onready var score = $VBoxContainer/Texts/Score
@onready var layer = $ParallaxBackground/Layer

var next_scene = preload("res://scenes/game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	score.text = 'Score: ' + str(Global.score)
	
func _process(_delta):
	layer.motion_offset.x = layer.get_motion_offset().x - Global.scrolling_speed
	
func _on_retry_pressed():
	get_tree().change_scene_to_packed(next_scene)
	
func _on_quit_pressed():
	get_tree().quit()
