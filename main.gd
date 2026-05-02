extends CharacterBody2D

var speed = 150 * 3
var gravity = 980 * 3
var gravity_direction = 1  # 1 = normal, -1 = flipped
var is_flipping = false     # tracks if we just flipped

@onready var sprite = $AnimatedSprite2D

func _ready():
	add_to_group("player")

func _physics_process(delta):
	velocity.y += gravity * gravity_direction * delta

	# Gravity flip
	if Input.is_action_just_pressed("ui_accept"):
		gravity_direction *= -1
		velocity.y = 0
		up_direction = Vector2(0, -gravity_direction)
		sprite.flip_v = gravity_direction == -1
		is_flipping = true          # flag the flip
		sprite.play("jump")         # play jump INSTANTLY on press

	velocity.x = speed
	move_and_slide()

	# --- Animations ---
	if is_flipping:
		# stay in jump anim until we land
		if is_on_floor():
			is_flipping = false     # landed, clear the flag
	else:
		if velocity.x != 0:
			sprite.play("run")
		else:
			sprite.play("idle")
