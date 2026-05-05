extends CharacterBody2D

var speed = 150 * 6
var gravity = 980 * 3

var gravity_direction = 1  


var is_flipping = false     

@onready var sprite = $AnimatedSprite2D



func _ready():
	add_to_group("player")

func _physics_process(delta):
	velocity.y += gravity * gravity_direction * delta

	
	if Input.is_action_just_pressed("ui_accept"):
		SoundManager.play_coin()
		
		gravity_direction *= -1
		
		velocity.y = 0
		
		up_direction = Vector2(0, -gravity_direction)
		
		sprite.flip_v = gravity_direction == -1
		is_flipping = true         
		sprite.play("jump")         

	velocity.x = speed
	move_and_slide()

	
	if is_flipping:
		
		
		if is_on_floor():
			
			is_flipping = false     
	else:
		
		if velocity.x != 0:
			sprite.play("run")
		else:
			sprite.play("idle")
