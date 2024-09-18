extends CharacterBody2D

func asteroid_live():
	var v_a = -(30 + 17.5*Global.scrolling_speed)
	if position.x < -220:
		position.x = randi_range(-30,10)
		position.y = randi_range(-20,20)
		velocity = Vector2(v_a,randf_range(-2,2))
		
	if velocity.y > 0:
		rotation_degrees -= Global.scrolling_speed
	else:
		rotation_degrees += Global.scrolling_speed
	
	move_and_slide()
	
func die():
	if get_slide_collision_count() > 0:
		if 'CharacterBody2D' in str(get_last_slide_collision().get_collider()):
			Global.gameOver = true

func _process(_delta):
	asteroid_live()
	die()
