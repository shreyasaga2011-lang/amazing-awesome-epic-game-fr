extends Sprite2D


var timer_seconds: float = 0.0  # Current timer
var timer_interval: float = 15.0  # 15 seconds

func _physics_process(delta):
	scale.x += 0.0009
	if playerGlobal.alive:
		timer_seconds += delta  
		if timer_seconds >= timer_interval:
			_on_timer_timeout()
			timer_seconds = 0  

func _on_timer_timeout():
	print("Timer expired! 15 seconds passed.")
