
extends Node

signal score_changed(new_score)

var score: int = 0

func add_score(amount: int) -> void:
	score += amount
	emit_signal("score_changed", score)
