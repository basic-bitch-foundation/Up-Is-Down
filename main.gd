extends CharacterBody2D
var speed = 150*3
var gravity = 980*3
func _ready():
	add_to_group("player")
func _physics_process(delta):
	velocity.y+= gravity*delta
	
	
	if Input.is_action_just_pressed("ui_accept"):
		gravity *= -1
		scale.y *= -1
		velocity.y = 0 
		
	
	
	
	
	velocity.x = speed
	move_and_slide()
