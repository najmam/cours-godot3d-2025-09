extends Camera3D

const ROTATION_SPEED = 1.

# préférences de contrôle de la caméra :
# ici préférences perso du prof,
# changez à votre convenance
# ou rendez ça paramétrable (exercice bonus !)
var cam_invert_horizontal = 1. # ne pas inverser
var cam_invert_vertical = -1. # inverser

func _process(delta: float) -> void:
	var cam_ud = Input.get_axis("camera_down", "camera_up")
	var cam_rotation_delta_vert = cam_ud * delta * ROTATION_SPEED
	rotation.x += cam_rotation_delta_vert * cam_invert_vertical
	var cam_lr = Input.get_axis("camera_right", "camera_left")
	var cam_rotation_delta_hor = cam_lr * delta * ROTATION_SPEED
	global_rotation.y += cam_rotation_delta_hor * cam_invert_horizontal
