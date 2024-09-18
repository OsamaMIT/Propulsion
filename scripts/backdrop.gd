extends Node

@onready var layer = $ParallaxBackground/Layer

func _on_button_item_selected(index):
	var layers = layer.get_children()
	for i in layers:
		i.hide()
	layers[index].show()
	Global.layer_index = index 

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
