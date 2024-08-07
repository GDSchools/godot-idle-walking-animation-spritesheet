extends CharacterBody2D

const SPEED = 300.0
@onready var animated_sprite = $AnimatedSprite2D
func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walking")
		
	move_and_slide()
	
	
