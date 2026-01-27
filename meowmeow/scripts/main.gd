extends Node2D

# ---------------------------------
@onready var camera: Camera2D = $camera
@onready var scoreLabel: Label = $ScoreLayer/Score

var grounds: PackedScene = preload("res://scenes/platform.tscn")
var background: PackedScene = preload("res://scenes/background.tscn")

var moving: bool = false
var platformInstances: int
var backgroundInstance: int

@export var speeds: SpeedValues
# ----------------------------------

func _ready() -> void:
	$AudioStreamPlayer.playing = globals.isMusicOn
	$AudioStreamPlayer.stream.loop = true
	globals.player_died.connect(on_player_death) # Third step, connect the signal to a function (the parameter in the parentheses is the name of the function defined at the bottom of the script
	reset_stats()
	default_speeds()
	
func _process(_delta: float) -> void:
	if globals.isCountdownFinished:
		$ScoreLayer.visible = true
	update_all_scores()
	check_score()
	update_speeds()
	
func reset_stats():
	globals.score = 0
	globals.isCountdownFinished = false
	$Player.isDead = false
	
func default_speeds():
	speeds.spawnInterval = 0.01
	speeds.cameraSpeed = 2
	speeds.playerSpeed = 140
	
func update_speeds():
	$Player.speed = speeds.playerSpeed
	camera.speed = speeds.cameraSpeed
	$Timer1.wait_time = speeds.spawnInterval
	
func update_all_scores():
	scoreLabel.text = "%s" %[str(globals.score)]

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

func on_player_death(): # Fourth step, define the function that will run once the signal is emitted
	if $Player.isDead == true:
		match globals.gameMode:
			1:
				if globals.score == 75:
					pass # go to congrats scene
			2:
				if globals.score > globals.highScoreEndless:
					globals.highScoreEndless = globals.score
	await get_tree().create_timer(2).timeout
	get_tree().paused = true
