
extends Marker2D

func _ready():
	
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.global_position = global_position
