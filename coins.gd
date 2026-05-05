
extends Area2D

const COIN_VALUE = 10

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body:Node):
	
	if body.is_in_group("player"):
		SoundManager.play_jump()
		
		ScoreManager.add_score(COIN_VALUE)
		queue_free()
