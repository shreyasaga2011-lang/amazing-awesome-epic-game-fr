extends Area2D



func _on_body_entered(body: Node2D) -> void:
	checkpointGlobal.currentX = position.x
	checkpointGlobal.currentY = position.y
