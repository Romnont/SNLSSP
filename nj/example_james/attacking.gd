# ====== ATTACKING STATE ======
extends State
class_name AttackingState

@onready var player: CharacterBody2D = get_node("../..")
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")

var attack_timer: float = 0.0
var attack_duration: float = 0.5  # Duración del ataque en segundos

func Enter():
	animated_sprite.play("basic_attack")
	player.velocity.x = 0
	attack_timer = 0.0

func Update(delta: float):
	player.velocity.x = 0
	attack_timer += delta
	
	# Cambiar a Idle después del tiempo especificado
	if attack_timer >= attack_duration:
		state_transition.emit(self, "Idle")

func Exit():
	attack_timer = 0.0				
