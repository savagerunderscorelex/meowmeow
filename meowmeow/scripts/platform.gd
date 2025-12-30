extends Node2D

var speed: int = 150
var enter = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# position.x -= speed * delta
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	enter += 1
	if enter == 1:
		print("first entrance, one point added")
	else:
		print("you've already entered")
	
