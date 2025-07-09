extends Camera2D

const ZOOM_STEP = 0.1
const MIN_ZOOM = 0.5
const MAX_ZOOM = 3.0

func _process(_delta):
	if Input.is_action_just_released("zoom_in"):
		zoom = (zoom - Vector2(ZOOM_STEP, ZOOM_STEP)).clamp(Vector2(MIN_ZOOM, MIN_ZOOM), Vector2(MAX_ZOOM, MAX_ZOOM))
	elif Input.is_action_just_released("zoom_out"):
		zoom = (zoom + Vector2(ZOOM_STEP, ZOOM_STEP)).clamp(Vector2(MIN_ZOOM, MIN_ZOOM), Vector2(MAX_ZOOM, MAX_ZOOM))
 
