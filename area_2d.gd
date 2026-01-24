extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var counter = 0
func _on_body_entered(body: CharacterBody2D):
	if position.y < checkpointGlobal.currentY:
		audio_stream_player_2d.play()
		checkpointGlobal.currentX = position.x
		checkpointGlobal.currentY = position.y
		checkpointGlobal.reset_timer()
		checkpointGlobal.resetFire()
