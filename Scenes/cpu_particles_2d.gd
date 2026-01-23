extends CPUParticles2D

@export var base_amount: int = 300
@export var min_scale: float = 2.5
@export var max_scale: float = 10.0
@export var min_speed: float = 50.0
@export var max_speed: float = 600.0

func _ready() -> void:
	one_shot = false
	emitting = true

	amount = base_amount
	explosiveness = 0

	direction = Vector2.UP
	gravity = Vector2(0, 200)

	lifetime = 3
	lifetime_randomness = 0.1
	emission_shape = EMISSION_SHAPE_SPHERE
	emission_sphere_radius = 20.0
