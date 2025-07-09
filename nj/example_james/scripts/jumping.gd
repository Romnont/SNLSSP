# ====== JUMPING STATE ======
extends State
class_name JumpingState

@onready var player: CharacterBody2D = get_node("../..")#get_owner()
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")  # Ruta corregida


func Enter():
	player.velocity.y = player.JUMP_FORCE
	animated_sprite.play("jump")

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
	
	# Transición a caída cuando la velocidad Y es positiva
	if player.velocity.y > 0:
		state_transition.emit(self, "falling")
