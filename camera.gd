extends Node3D

const ROTATION_SPEED = Vector3(1,1,1)

# préférences de contrôle de la caméra :
# ici préférences perso du prof,
# changez à votre convenance
# ou rendez ça paramétrable (exercice bonus !)
var cam_invert_horizontal = 1. # ne pas inverser
var cam_invert_vertical = -1. # inverser

func _process(delta: float) -> void:
	var cam_lr = Input.get_axis("camera_left", "camera_right")
	var cam_ud = Input.get_axis("camera_down", "camera_up")
	var cam_input = Vector3.UP * cam_lr + Vector3.RIGHT * cam_ud
	var cam_rotation_delta = cam_input * delta * ROTATION_SPEED
	rotation.x += cam_rotation_delta.x * cam_invert_vertical
	global_rotation.y += cam_rotation_delta.y * cam_invert_horizontal
