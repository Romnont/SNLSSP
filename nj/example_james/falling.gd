# ====== FALLING STATE ======
extends State
class_name FallingState

@onready var player: CharacterBody2D = get_node("../..")#get_owner()
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")  # Ruta corregida


func Enter():
	# Si tienes animación de caída, úsala
	# animated_sprite.play("fall")
	pass

func Update(delta: float):
	var direction = 0.0
	
	# Movimiento horizontal en el aire
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		direction -= 1
		animated_sprite.flip_h = true
	elif Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		direction += 1
		animated_sprite.flip_h = false
	
	player.velocity.x = direction * player.SPEED
	
	# Transición al tocar el suelo
	if player.is_on_floor():
		if direction != 0:
			state_transition.emit(self, "running")
		else:
			state_transition.emit(self, "idle")
	else: state_transition.emit(self, "falling")
