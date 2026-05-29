
extends Area2D



func _ready():
	body_entered.connect(_on_hit)

func _on_hit(body: Node):
	if body.is_in_group("player"):
		
		get_node("/root/Node2D/game_over").show_win()
		
