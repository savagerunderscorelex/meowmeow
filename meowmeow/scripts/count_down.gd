extends CanvasLayer

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var runs: int = 0
func _ready() -> void:
	animator.play("number")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "number":
		globals.is_countdown_finished = true
		self.visible = false
