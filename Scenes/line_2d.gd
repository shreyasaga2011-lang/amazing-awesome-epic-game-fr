extends Line2D
var max_length := 600.0  # maximum drag length
var drag_start := Vector2()
var is_dragging := false
@onready var drag_line := self  # if script is on Line2D

func _input(event):
	if playerGlobal.jumpCount < 1:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_dragging = true
				drag_start = get_global_mouse_position()
				drag_line.clear_points()
				drag_line.add_point(drag_line.to_local(drag_start))  # start point
				drag_line.add_point(drag_line.to_local(drag_start))  # placeholder end
				drag_line.visible = true
			else:
				is_dragging = false
				drag_line.visible = false
				drag_line.clear_points()

func _process(_delta):
	if is_dragging:
		var mouse_pos = get_global_mouse_position()
		var dir = mouse_pos - drag_start

		# Clamp length if needed
		if dir.length() > max_length:
			mouse_pos = drag_start + dir.normalized() * max_length
			dir = mouse_pos - drag_start

		# Move the second point
		drag_line.set_point_position(1, drag_line.to_local(mouse_pos))

		# --- THIS IS WHERE YOU PUT STRENGTH COLOR ---
		var strength := dir.length() / max_length  # 0 → 1
		drag_line.default_color = Color(1, 1, 0).lerp(Color(1, 0.3, 0.1), strength)
