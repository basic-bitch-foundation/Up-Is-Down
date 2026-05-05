extends CanvasLayer

@onready var blur_bg = $blurbg        
@onready var digit_tens = $score/tens
@onready var digit_units = $score/units
@onready var tap_restart = $restart

func _ready():
	visible = false
	tap_restart.process_mode = Node.PROCESS_MODE_ALWAYS
	tap_restart.pressed.connect(_on_tap_restart)

func show_screen():
	_update_score(ScoreManager.score)
	visible = true
	SoundManager.play_game_over()
	get_tree().paused = true

func _update_score(value: int):
	digit_tens.texture = load("res://0-9/" + str((value / 10) % 10) + ".png")
	digit_units.texture = load("res://0-9/" + str(value % 10) + ".png")

func _on_tap_restart():
	get_tree().paused = false
	get_tree().reload_current_scene()
