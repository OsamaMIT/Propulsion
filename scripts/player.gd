extends CharacterBody2D

var speed = 20
var momentum = Vector2(0,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	# Handle aim up and down.
	if Input.is_action_pressed("up") and rotation_degrees > -65.1:
		rotation_degrees = rotation_degrees - 2.864789
		#rotation = rotation - 0.5 (basically) same thing
	if Input.is_action_pressed("down") and rotation_degrees < 65.1:
		rotation_degrees = rotation_degrees + 2.864789
		#rotation = rotation + 0.05 (basically) same thing
	
	var direction = Vector2(cos(rotation),sin(rotation))
	var push = speed * direction.normalized()
	
	momentum = momentum + (push-momentum)/50
	velocity = momentum
	
	Global.scrolling_speed = velocity.x/20
	velocity.x = 0
	
	speed += 0.01

	move_and_slide()
