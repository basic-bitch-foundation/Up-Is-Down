
extends CanvasLayer

@onready var score_container = $score

func _ready():
	ScoreManager.score_changed.connect(_on_score_changed)
	_update_display(0)

func _on_score_changed(new_score: int) -> void:
	_update_display(new_score)


func _update_display(value: int) -> void:
	for child in score_container.get_children():
		child.queue_free()

	var digits = str(value)
	for d in digits:
		var tex_rect = TextureRect.new()
		tex_rect.texture = load("res://icon.svg")   
		tex_rect.custom_minimum_size = Vector2(32, 32)
		tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		score_container.add_child(tex_rect)



#func _update_display(value: int):
#	for child in score_container.get_children():
#		child.queue_free()
#
#	var digits = str(value)
#	for d in digits:
#		var tex_rect = TextureRect.new()
#		tex_rect.texture = load("res://digits/" + d + ".png")
#		tex_rect.custom_minimum_size = Vector2(32, 32)
#		tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
#		score_container.add_child(tex_rect)
