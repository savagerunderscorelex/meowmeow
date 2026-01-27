extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	appear_home_button()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$RichTextLabel.text = "[wave amp=200.0 freq=9.0 connected=0]Congratulations! You won Story Mode![/wave]"


func appear_home_button():
	await get_tree().create_timer(5).timeout
	$Button.disabled = false
	$Button.visible = true


func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/enter.tscn")
