extends CharacterBody2D

var speed = 300
var jumpSpeed = -speed * 2
var gravity = speed * 3


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	update_movement(delta)
	update_animation()
	move_and_slide()

func update_animation():
	if velocity.x < 0:
		$AnimatedSprite2D.play("jump")
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
func get_input():
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jumpSpeed
	
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed

func update_movement(delta: float) -> void:
	velocity.y += gravity * delta
