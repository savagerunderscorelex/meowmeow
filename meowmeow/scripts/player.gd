extends CharacterBody2D

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

var speed: int = 200
var jumpSpeed: int = -speed * 2
var gravity: int = speed * 3
var jumps: int = 2

func _physics_process(delta: float) -> void:
	get_input()
	update_movement(delta)
	update_animation()
	update_flipping()
	move_and_slide()
	
func update_animation(): # updates player animation
	# The first condition checks if the player is on the floor to prevent the walking and idle animations
	# to be played while jumping 
	if is_on_floor():
		if velocity.x != 0: # Not idle, left and right
			animator.play("walking")
		elif velocity.x == 0:
			animator.play("idle")
	else:
		if velocity.y < 0:
			animator.play("jump")
			
func update_flipping(): # Created a separate function for flipping to allow the player to flip while jumping
	if velocity.x < 0:
		animator.flip_h = true
	elif velocity.x > 0:
		animator.flip_h = false

func get_input():
	if Input.is_action_just_pressed("jump") && jumps > 0:
		velocity.y = jumpSpeed
		jumps -= 1
	elif is_on_floor(): 
		jumps = 2
	
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed

func update_movement(delta: float) -> void: # Force of gravity
	velocity.y += gravity * delta
