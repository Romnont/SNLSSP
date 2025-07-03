# ====== IDLE STATE ======
extends State
class_name IdleState

@onready var player: CharacterBody2D = get_node("../..")#get_owner()
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")  


func Enter():
	print("Player: ", player)
	print("AnimatedSprite: ", animated_sprite)
	if animated_sprite:
		print("Animaciones disponibles: ", animated_sprite.sprite_frames.get_animation_names())
		animated_sprite.play("Idle")
func Update(delta: float):
	# Transiciones
	if not player.is_on_floor():
		state_transition.emit(self, "Falling")
	elif Input.is_action_just_pressed("move_jump") or Input.is_action_just_pressed("ui_up"):
		state_transition.emit(self, "Jumping")
	elif Input.is_action_pressed("move_sit") or Input.is_action_pressed("ui_down"):
		state_transition.emit(self, "Sitting")
	elif Input.is_action_just_pressed("basic_attack"):
		state_transition.emit(self, "Attacking")
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		state_transition.emit(self, "running")
