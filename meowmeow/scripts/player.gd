extends CharacterBody2D

@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

var speed: int = 200
var jumpSpeed: int = -speed * 2
var gravity: int = speed * 3
var jumps: int = 2
var isDead: bool = false

# Process
func _physics_process(delta: float) -> void:
	if globals.isCountdownFinished && get_parent().name == "main":
		# I think that this is a better way of coding platformer movement with GDScript
		# The tutorial I used to first learn made me put character flipping and horizontal movement logic within
		# the same function, which made it way harder to code and look right.
		get_input() # get the player input
		update_animation() # change the animation ONLY
		update_flipping() # change the flipping ONLY
		update_movement(delta) # change the actual movement of the player character ONLY
	elif get_parent().name == "congrats":
		congrats()
	elif get_parent().name == "enter" or "GameMode":
		enter_screen_animation()
	
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
	elif is_on_floor(): # resets the amount of jumps the player has
		jumps = 2
	
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed

func update_movement(delta: float) -> void: # Force of gravity
	velocity.y += gravity * delta

func enter_screen_animation():
	animator.play("idle")
	
func congrats():
	$AnimationPlayer.play("celebrate")
