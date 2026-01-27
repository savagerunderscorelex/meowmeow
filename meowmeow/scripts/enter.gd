extends Control

@onready var options: Panel = $OptionsPanel
@onready var how2play: Panel = $How2Play

func _ready() -> void:
	$OptionsPanel/Label/CheckButton.set_pressed_no_signal(true)
	
func _process(_delta: float) -> void:
	pass

func _on_play_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/game_mode.tscn")

func _on_how_to_play_button_pressed() -> void:
	how2play.visible = true
	
func _on_options_button_pressed() -> void:
	options.visible = true

func _on_check_button_toggled(_toggled_on: bool) -> void:
	print("hi")
	globals.isMusicOn = !globals.isMusicOn
	$AudioStreamPlayer.playing = globals.isMusicOn

func _on_button_pressed() -> void:
	options.visible = false


func _on_how_button_pressed() -> void:
	how2play.visible = false
