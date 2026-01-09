extends CanvasLayer

func _process(_delta: float) -> void:
	if get_tree().paused == true:
		self.visible = true
		$Button.disabled = false
		
func _on_button_pressed() -> void:
	get_tree().paused = false 
	get_tree().call_deferred("reload_current_scene")
