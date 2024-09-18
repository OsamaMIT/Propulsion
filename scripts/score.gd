extends CanvasLayer

@onready var label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	label.text = str(Global.score)
