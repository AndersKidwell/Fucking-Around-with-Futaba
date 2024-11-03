extends Sprite2D

@export var speed = 400 # How fast the player will move.
@export var rotate_speed = 0.02
@export var scale_speed = 0.02
@export var default_scale = Vector2(0.423, 0.373)
var default_rotation = 0
var default_position = Vector2(605, 324)

var screen_size #Size of the game window.
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("rotate_right"):
		rotate(rotate_speed)
	if Input.is_action_pressed("rotate_left"):
		rotate(-rotate_speed)
	if Input.is_action_pressed("scale_up"):
		scale += Vector2(0.01, 0.01)
	if Input.is_action_pressed("scale_down"):
		scale -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("reset_scale"):
		scale = default_scale
	if Input.is_action_pressed("reset_rotation"):
		rotation = default_rotation
	if Input.is_action_pressed("reset_position"):
		position = default_position
	if Input.is_action_pressed("reset_all"):
		scale = default_scale
		rotation = default_rotation
		position = default_position
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

# Testing Testing 1, 2, 3!
