extends Control

@onready var layer = $ParallaxBackground/Layer

var next_scene = preload("res://scenes/game.tscn")

func _process(_delta):
	layer.motion_offset.x = layer.get_motion_offset().x - Global.scrolling_speed
	
func _on_play_button_pressed():
	get_tree().change_scene_to_packed(next_scene)
	
func _on_exit_button_pressed():
	get_tree().quit()

func _on_style_pressed():
	get_tree().change_scene_to_file("res://scenes/backdrop.tscn")
