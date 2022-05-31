extends KinematicBody2D

export var ACCELERATION = 50000
export var MAX_SPEED = 200
export var FRICTION = 5000
export var ROLL_SPEED = 300
var velocity = Vector2.ZERO


var can_fire = true
var bulletForce = 100
var fireRate = 0.1
var bullet = preload("res://Test/TestBullet.tscn")
onready var firePoint = get_node("Gun/FirePoint")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = firePoint.get_global_position()
		bullet_instance.apply_impulse(Vector2(), Vector2(bulletForce, 0))
		
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fireRate), "timeout")
		can_fire = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
