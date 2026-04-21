extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	
	
	
	
func _on_body_entered(body):
	
	
	if body.is_in_group("player"):
		get_tree().current_scene.getnode("CanvasLayer")._add_score(1)
		print("Coin Collected")
		queue_free()
