extends Sprite2D

var canvas_layer: CanvasLayer

func _ready():
	# Create CanvasLayer with explicit settings
	canvas_layer = CanvasLayer.new()
	canvas_layer.layer = 100  # Put it on top
	canvas_layer.follow_viewport_enabled = false
	canvas_layer.follow_viewport_scale = 1.0
	get_tree().root.add_child(canvas_layer)
	get_parent().remove_child(self)
	canvas_layer.add_child(self)
	
	
	position = Vector2(get_viewport().get_visible_rect().size.x / 2,20)

func _process(_delta):
	# Force position every frame to ensure it stays put
	var viewport_size = get_viewport().get_visible_rect().size
	position = Vector2(viewport_size.x / 2, 20)

func _physics_process(delta):
	scale.x += 0.0059
	if !playerGlobal.alive:
		scale.x = 0.035
	if checkpointGlobal.fireReset == true:
		scale.x = 0.035
