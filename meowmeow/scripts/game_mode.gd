extends Control

func _ready() -> void:
	$AudioStreamPlayer.playing = globals.isMusicOn

func _on_endless_button_pressed() -> void:
	globals.gameMode = 2
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")

func _on_story_button_pressed() -> void:
	globals.gameMode = 1
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")
