extends Node2D

@onready var camera: Camera2D = $camera
@onready var scoreLabel: Label = $ScoreLayer/Score

var grounds: PackedScene = preload("res://scenes/platform.tscn")
var background: PackedScene = preload("res://scenes/background.tscn")

var moving: bool = false
var platformInstances: int
var backgroundInstance: int

@export var speeds: SpeedValues

func _ready() -> void:
	$AudioStreamPlayer.stream.loop = true
	reset_stats()
	default_speeds()
	
func reset_stats():
	globals.score = 0
	globals.is_countdown_finished = false
	
func default_speeds():
	speeds.spawnInterval = 0.01
	speeds.cameraSpeed = 2
	speeds.playerSpeed = 130
	
func _process(_delta: float) -> void:
	if globals.is_countdown_finished:
		$ScoreLayer.visible = true
	scoreLabel.text = "%s" %[str(globals.score)]
	check_score()
	$Player.speed = speeds.playerSpeed
	camera.speed = speeds.cameraSpeed
	$Timer1.wait_time = speeds.spawnInterval
	
func _on_timer_timeout() -> void:
	var groundsInstance = grounds.instantiate() # Creates new instance of the platforms
	# References the last node in the group platforms (compare to referencing the last node in the tree,
	# which came with a lot of errors...)
	var previousInstance = get_tree().get_nodes_in_group("Platforms").back()
	groundsInstance.position.x = previousInstance.position.x + randi_range(275,500)
	groundsInstance.position.y = randi_range(100, 300)
	add_child(groundsInstance)
	platformInstances += 1
	
	match platformInstances:
		50:
			speeds.spawnInterval = 0.5
			print("too much")
		75:
			speeds.spawnInterval = 2
			print(75)
	
	$Timer1.start()

func check_score():
	match globals.score:
		10:
			speeds.playerSpeed = 200
			speeds.cameraSpeed = 3
		25:
			speeds.playerSpeed = 270
			speeds.cameraSpeed = 4
		50:
			speeds.playerSpeed = 325
			speeds.cameraSpeed = 5.5
