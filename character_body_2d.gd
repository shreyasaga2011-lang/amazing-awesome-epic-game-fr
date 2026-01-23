extends CharacterBody2D
@onready var cpu_particles_2d_2: CPUParticles2D = $CPUParticles2D2
@export var max_power: float = 1000.0
@export var gravity: float = 1500.0
@export var friction: float = 0.98
@export var ground_friction: float = 0.94
@export var horizontal_multiplier: float = 5
@export var vertical_multiplier: float = 5
@export var max_jumps: int = 1
@onready var timer: Timer = $Timer
var drag_start: Vector2
var is_dragging: bool = false
var jump_count: int = 0

func _ready():
	timer.wait_time = 15
	timer.one_shot = false   
	timer.start()
	timer.timeout.connect(_on_Timer_timeout)
	
func _on_Timer_timeout():
	print("Timer expired! 15 seconds passed.")
	playerGlobal.death()

func _physics_process(delta):
	playerGlobal.currentVelocityX = velocity.x 
	playerGlobal.currentVelocityY = velocity.y
	if not is_dragging:
		# Apply gravity
		velocity.y += gravity * delta
		
		# Apply friction
		if is_on_floor():
			velocity.x *= ground_friction
			jump_count = 0
		else:
			velocity.x *= friction
			
		move_and_slide()
	if playerGlobal.alive == false:
		position.x = checkpointGlobal.currentX
		position.y = checkpointGlobal.currentY
		cpu_particles_2d_2.emitting = true
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and jump_count < max_jumps:
			# Start dragging
			drag_start = get_global_mouse_position()
			is_dragging = true
		elif event.is_released() and is_dragging:
			# Release - shoot the ball
			shoot()
			is_dragging = false
			jump_count += 1

func shoot():
	var drag_end = get_global_mouse_position()
	var direction = drag_start - drag_end
	var power = min(direction.length(), max_power)
	
	# Apply multipliers to favor horizontal movement
	var launch_velocity = direction.normalized() * power
	launch_velocity.x *= horizontal_multiplier
	launch_velocity.y *= vertical_multiplier
	velocity = launch_velocity
