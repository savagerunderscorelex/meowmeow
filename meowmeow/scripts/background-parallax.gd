extends Node2D
@onready var trees: Sprite2D = $ForestLong

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_to_group("Backgrounds")
