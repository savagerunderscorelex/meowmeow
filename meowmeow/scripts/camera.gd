extends Node2D

var speed: int = 1
var moving: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moving = true

func _process(_delta: float) -> void:
	if moving == true:
		await get_tree().create_timer(2).timeout
		moving = false
	else: 
		self.position.x += speed

func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().paused = true
	elif body.name == "Platform":
		await get_tree().create_timer(3).timeout
		print("you've been removed")
		get_tree().queue_delete(body.get_parent())
