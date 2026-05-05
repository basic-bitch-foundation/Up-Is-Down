extends Node2D

@onready var astronaut = $astronaut
@onready var text_up = $up
@onready var text_is = $is
@onready var text_down = $down
@onready var play = $play
@onready var info = $info




var floating_bodies = {}

func _ready():
	PhysicsServer2D.area_set_param(
		get_viewport().find_world_2d().space,
		PhysicsServer2D.AREA_PARAM_GRAVITY,
		0
	)

	_setup_floating(astronaut, 120.0, true)
	_setup_floating(text_up, 100.0, false)
	_setup_floating(text_is, 100.0, false)
	_setup_floating(text_down, 100.0, false)

	play.pressed.connect(_on_play_pressed)
	info.pressed.connect(_on_info_pressed)

func _setup_floating(body: RigidBody2D, speed: float, can_rotate: bool):
	body.gravity_scale = 0
	body.physics_material_override = PhysicsMaterial.new()
	body.physics_material_override.bounce = 1.0
	body.physics_material_override.friction = 0.0

	var angle = randf() * TAU
	body.linear_velocity = Vector2(cos(angle), sin(angle)) * speed

	if can_rotate:
		body.angular_velocity = 1.2 * (1 if randf() > 0.5 else -1)
	else:
		body.lock_rotation = true

	
	floating_bodies[body] = speed

func _physics_process(_delta):
	for body in floating_bodies:
		
		var target_speed = floating_bodies[body]
		var current = body.linear_velocity
		
		if current.length() < 0.1:
			var angle = randf() * TAU
			body.linear_velocity = Vector2(cos(angle), sin(angle)) * target_speed
		else:
			
			body.linear_velocity = current.normalized() * target_speed
			
func _on_play_pressed():
	SoundManager.play_click()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://map.tscn")

func _on_info_pressed():
	SoundManager.play_click()
	OS.shell_open("https://github.com/basic-bitch-foundation/Up-Is-Down")
