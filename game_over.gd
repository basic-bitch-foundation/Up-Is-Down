extends CanvasLayer
 
@onready var blur_bg    = $blurbg
@onready var dig_ten    = $score/tens
@onready var dig_unit   = $score/units
@onready var tap_rst    = $restartchange 
 
func _ready():
	visible = false
	tap_rst.process_mode = Node.PROCESS_MODE_ALWAYS
	tap_rst.pressed.connect(_on_rst)
 

func show_screen():
	_upd_score(ScoreManager.score)
	visible = true
	SoundManager.play_game_over()
	get_tree().paused = true
 

func show_win():
	_upd_score(ScoreManager.score)
	visible = true
	SoundManager.play_game_over()
	
 
func _upd_score(v: int):
	dig_ten.texture  = load("res://0-9/" + str((v / 10) % 10) + ".png")
	dig_unit.texture = load("res://0-9/" + str(v % 10) + ".png")
 
func _on_rst():
	get_tree().paused = false
	get_tree().reload_current_scene()
