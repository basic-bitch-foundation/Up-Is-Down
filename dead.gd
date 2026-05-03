# dead_zone.gd
# Add two Area2D nodes with CollisionShape2D (long horizontal rectangles)
# one above the map, one below — attach this script to both
extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()  # restart on death
		# swap above line with your own death screen later
