extends Sprite2D

var speed: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = get_parent().speeds.cameraSpeed
	if get_parent().get_child(5).moving == false:
		await get_tree().create_timer(5).timeout
	else: 
		self.position.x += speed
