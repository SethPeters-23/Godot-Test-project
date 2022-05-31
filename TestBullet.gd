extends RigidBody2D


func _on_TestBullet_body_entered(body):
	print("bullet hit:", body)
	queue_free()
