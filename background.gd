extends CanvasLayer

@export var scroll_speed: float = 200.0
@export var bg_scale: Vector2 = Vector2(1.0, 1.0)  

var bg_width: float = 0.0

@onready var bg1 = $bg1
@onready var bg2 = $bg2

func _ready():
	await get_tree().process_frame

	var vp = get_viewport().get_visible_rect().size
	bg_width = vp.x

	
	bg1.scale = bg_scale
	bg2.scale = bg_scale

	bg1.position = Vector2(vp.x / 2, vp.y / 2)
	bg2.position = Vector2(vp.x + vp.x / 2, vp.y / 2)

func _process(delta):
	bg1.position.x -= scroll_speed * delta
	bg2.position.x -= scroll_speed * delta

	if bg1.position.x <= -bg_width / 2:
		bg1.position.x = bg2.position.x + bg_width

	if bg2.position.x <= -bg_width / 2:
		bg2.position.x = bg1.position.x + bg_width
