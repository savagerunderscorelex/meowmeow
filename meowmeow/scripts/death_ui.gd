extends CanvasLayer

func _process(_delta: float) -> void:
	$HighScoreLabelEndless/HighScoreEndless.text = "%s" %[str(globals.highScoreEndless)]
	$ScoreLabel/Score.text = "%s" %[str(globals.score)]
	if get_tree().paused == true:
		self.visible = true
		$Button.disabled = false
		
		
func _on_button_pressed() -> void:
	get_tree().paused = false 
	get_tree().call_deferred("reload_current_scene")
