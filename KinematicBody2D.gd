extends KinematicBody2D

export var speed = 100
export var gravity_factor = 30
export var jumpH = 500

var velocity = Vector2.ZERO

func _physics_process(delta):
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		if is_on_floor():
			$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
		if is_on_floor():
			$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jumpH
		
		
	if velocity.y < 200:
		velocity.y += gravity_factor
	
	if velocity.x == 0 and is_on_floor():
		$AnimatedSprite.play("idle")
	if velocity.y < 0:
		$AnimatedSprite.play("jump")
	if velocity.y > 0 and not is_on_floor():
		$AnimatedSprite.play("fall")
		
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = 0
	
	



func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
