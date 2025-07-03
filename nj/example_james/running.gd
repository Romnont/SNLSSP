# ====== RUNNING STATE ======
extends State
class_name RunningState

@onready var player: CharacterBody2D = get_node("../..")#get_owner()
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")  # Ruta corregida


func Enter():
	animated_sprite.play("run")

func Update(delta: float):
	var direction = 0.0
	
	# Movimiento
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		direction -= 1
		animated_sprite.flip_h = true
	elif Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		direction += 1
		animated_sprite.flip_h = false
	
	player.velocity.x = direction * player.SPEED
	
	# Transiciones
	if not player.is_on_floor():
		state_transition.emit(self, "Falling")
	elif Input.is_action_just_pressed("move_jump") or Input.is_action_just_pressed("ui_up"):
		state_transition.emit(self, "Jumping")
	elif Input.is_action_just_pressed("basic_attack"):
		state_transition.emit(self, "Attacking")
	elif direction == 0:
		state_transition.emit(self, "Idle")
