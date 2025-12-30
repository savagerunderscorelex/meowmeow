extends Node2D

@onready var camera: Camera2D = $camera
@onready var scoreLabel: Label = $CanvasLayer/Label

var moving: bool = false
var grounds: PackedScene = preload("res://scenes/platform.tscn")

@export var speeds: SpeedValues

func _process(_delta: float) -> void:
	scoreLabel.text = "%s" %[str(globals.score)]
	check_score()
	$Player.speed = speeds.playerSpeed
	camera.speed = speeds.cameraSpeed
	$Timer.wait_time = speeds.spawnInterval

	
func _on_timer_timeout() -> void:
	var groundsInstance = grounds.instantiate() # Creates new instance of the platforms
	var previousInstance = self.get_child(self.get_child_count()-1) # Initial reference platform to determine distance between instances (is the starting platform the player spawns on, which is the last child in the scene)
	groundsInstance.position.x = previousInstance.position.x + randi_range(250,500)
	groundsInstance.position.y = randi_range(100, 300)
	add_child(groundsInstance)
	
	$Timer.start()

func check_score():
	match globals.score:
		20:
			speeds.playerSpeed = 200
			speeds.cameraSpeed = 2
		30:
			speeds.playerSpeed = 250
			speeds.cameraSpeed = 4
