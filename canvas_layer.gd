extends CanvasLayer
var score = 0
@onready var scorelabel = $score
func _add_score(value):
	score += value
	scorelabel.text = "Score" + str(score)
