extends CollisionShape2D

signal win
signal fail

func _on_lemon_1_body_entered(body):
	win.emit()


func _on_fail_zone_body_entered(body):
	fail.emit()
