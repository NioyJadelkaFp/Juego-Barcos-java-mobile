extends Node2D
#Jairo deja de copiar codigos en ingles y ponlos en español
const SPEED = 200  # Ship's movement speed
var ROTATION_SPEED = 2  # Ship's rotation speed (can be adjusted)

var current_direction = Vector2.RIGHT  # Initial facing direction
var is_moving = false  # Flag to track movement state

func _process(delta):
	# Update rotation (optional, uncomment if you want continuous rotation during movement)
	# rotation += ROTATION_SPEED * delta
	# Move the ship forward while ui_up is pressed
	if Input.is_action_pressed("ui_up"):
		# Get a normalized facing direction based on rotation
		var facing_direction = Vector2.UP.rotated(rotation)
		translate(facing_direction * SPEED * delta)
		is_moving = true  # Set moving flag

	# Reset moving flag when ui_up is released
	if not Input.is_action_pressed("ui_up"):
		is_moving = false  # Reset moving flag

	# Update rotation based on movement state
	if is_moving:
		# Rotation can be updated here (e.g., based on input or AI)
		# For example, to rotate with keyboard controls:
		if Input.is_action_pressed("ui_left"):
			rotation -= ROTATION_SPEED * delta
		elif Input.is_action_pressed("ui_right"):
			rotation += ROTATION_SPEED * delta
	else:
		# Update rotation here if desired while not moving (e.g., for idle rotation)
		rotation += ROTATION_SPEED * delta  # Uncomment for continuous idle rotation
