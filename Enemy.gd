extends KinematicBody2D

var ACCELERATION = 50
var MAX_SPEED = 100
var FRICTION = 1000

var velocity = Vector2.ZERO

onready var player = get_node("/root/TestWorld/Player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION*delta)
	velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
