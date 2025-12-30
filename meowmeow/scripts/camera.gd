extends Node2D

var moving
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moving = true

func _process(_delta: float) -> void:
	if moving == true:
		await get_tree().create_timer(5).timeout
		moving = false
	else: 
		self.position.x += 1


func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().paused = true
