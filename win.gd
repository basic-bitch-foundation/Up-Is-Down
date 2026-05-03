# win_zone.gd
# Place an Area2D with CollisionShape2D at the end of your level
extends Area2D



func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		get_tree().paused = true
		
