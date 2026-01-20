extends Node2D
@onready var trees: Sprite2D = $ForestLong

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trees.add_to_group("Trees")
	self.add_to_group("Backgrounds")

func _process(delta: float) -> void:
	if globals.is_countdown_finished:
		trees.position.x -= 2
