extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var state_machine = $StateMachine

const SPEED = 200.0
const GRAVITY = 800.0  
const JUMP_FORCE = -500.0

func _ready():
	# La máquina de estados se encarga de todo
	pass

func _physics_process(delta):
	# Aplicar gravedad siempre
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	# La máquina de estados maneja el resto
	move_and_slide()
