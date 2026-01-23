extends Area2D

var counter = 0
func _on_body_entered(body: CharacterBody2D):
	if counter == 0:
		checkpointGlobal.currentX = position.x
		checkpointGlobal.currentY = position.y
		checkpointGlobal.reset_timer()
		checkpointGlobal.resetFire()
		counter += 1
	else:
		pass
