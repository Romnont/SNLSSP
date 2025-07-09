extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State
var states: Dictionary = {}

func _ready():
	# Registrar todos los estados hijos
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(on_child_transition)
	
	# Iniciar con el estado inicial
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)

func on_child_transition(state: State, new_state_name: String):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("Estado no encontrado: " + new_state_name)
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	current_state = new_state
