extends CharacterBody2D

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

var speed = 200
var jumpSpeed = -speed * 2
var gravity = speed * 3

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	update_movement(delta)
	update_animation()
	update_flipping()
	move_and_slide()

func update_animation():
	if is_on_floor():
		if velocity.x != 0:
			animator.play("walking")
		elif velocity.x == 0:
			animator.play("idle")
	else:
		if velocity.y < 0:
			animator.play("jump")
			
func update_flipping():
	if velocity.x < 0:
		animator.flip_h = true
	elif velocity.x > 0:
		animator.flip_h = false

func get_input():
	if Input.is_action_just_pressed("jump"):
		velocity.y = jumpSpeed
	
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed

func update_movement(delta: float) -> void:
	velocity.y += gravity * delta
