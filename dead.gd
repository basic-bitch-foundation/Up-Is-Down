extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node):
	if body.is_in_group("player"):
		
		get_node("/root/Node2D/game_over").show_screen()
