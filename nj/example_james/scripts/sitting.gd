# ====== SITTING STATE ======
extends State
class_name SittingState

@onready var player: CharacterBody2D = get_node("../..")#get_owner()
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")  # Ruta corregida


func Enter():
	animated_sprite.play("sit")
	player.velocity.x = 0

func Update(delta: float):
	# Mantener detenido
	player.velocity.x = 0
	
	# Transiciones
	if not (Input.is_action_pressed("move_sit") or Input.is_action_pressed("ui_down")):
		state_transition.emit(self, "Idle")
	elif Input.is_action_just_pressed("basic_attack"):
		state_transition.emit(self, "Attacking")
