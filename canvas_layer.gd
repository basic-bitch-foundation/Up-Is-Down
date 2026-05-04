extends CanvasLayer

@onready var digit_tens = $tens
@onready var digit_units = $units

func _ready():
	ScoreManager.score_changed.connect(_on_score_changed)
	_update_display(0)

func _on_score_changed(new_score: int):
	_update_display(new_score)

func _update_display(value: int):
	var tens = (value / 10) % 10
	var units = value % 10
	digit_tens.texture = load("res://0-9/" + str(tens) + ".png")
	digit_units.texture = load("res://0-9/" + str(units) + ".png")
		
