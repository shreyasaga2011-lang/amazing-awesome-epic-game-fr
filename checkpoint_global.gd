extends Node
var currentX = 300
var currentY = 300
var max_time := 15.0
var time_left := 15.0

func _ready():
	reset_timer()

func _process(delta: float) -> void:
	time_left -= delta

	if time_left <= 0.0:
		explode()

func explode():
	playerGlobal.death()
	reset_timer()

func reset_timer():
	time_left = max_time

var fireReset = false

func resetFire():
	fireReset = true
	await get_tree().create_timer(0.01).timeout
	fireReset = false
	reset_timer()
