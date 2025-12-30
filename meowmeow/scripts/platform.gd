extends Node2D

var speed: int = 150
var enter: int = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		enter += 1
		if enter == 1: # Prevents extra points from being added if the player reenters the area
			print("first entrance, one point added")
			globals.score += 5
		else:
			print("you've already entered")
	
