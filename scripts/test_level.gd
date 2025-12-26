extends Node2D

var grounds: PackedScene = preload("res://scenes/platform.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout() -> void:
	var groundsInstance = grounds.instantiate()
	groundsInstance.position.x = 1156
	groundsInstance.position.y = randi_range(100, 500)
	add_child(groundsInstance)
	$Timer.start()
