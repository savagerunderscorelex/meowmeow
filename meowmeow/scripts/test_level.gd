extends Node2D

var grounds: PackedScene = preload("res://scenes/platform.tscn")

func _on_timer_timeout() -> void:
	var groundsInstance = grounds.instantiate()
	groundsInstance.position.x = 1156 + randi_range(300, 500)
	groundsInstance.position.y = randi_range(100, 200)
	add_child(groundsInstance)
	$Timer.start()
