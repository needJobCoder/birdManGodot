extends CharacterBody2D

const SPEED = 40
const GRAVITY = 20
@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta):
	applyGravity()
	move(delta)
	handleAnimation()
	print(self.velocity)
	
func move(delta):
	if Input.is_action_pressed('ui_up'):
		velocity.y =  -SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	else:
		velocity = Vector2(0, 0)
		
	move_and_slide()
func handleAnimation():
	if self.is_on_floor():
		animatedSprite.play("default")
	else:
		animatedSprite.play('fly')


func applyGravity():
	if !is_on_floor():
		velocity.y = GRAVITY
