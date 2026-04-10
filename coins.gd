extends Area2D
signal collected(value)
func _ready():
	body_entered.connect(_on_body_entered)
	
	
	
	
func _on_body_entered(body):
	
	
	if body.is_in_group("player"):
		collected.emit(1)
		print("Coin Collected")
		queue_free()
