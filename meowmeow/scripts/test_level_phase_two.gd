extends Node2D

@onready var camera: Camera2D = $Camera2D
var moving = false
var grounds: PackedScene = preload("res://scenes/platform.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moving = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout() -> void:
	var groundsInstance = grounds.instantiate()
	var previousInstance = $StaticBody2D
	previousInstance = self.get_child(self.get_child_count()-1)
	groundsInstance.position.x = previousInstance.position.x + randi_range(250,500)
	# groundsInstance.position.x = 1156 + randi_range(300, 500)
	groundsInstance.position.y = randi_range(100, 300)
	add_child(groundsInstance)
	
	$Timer.start()
