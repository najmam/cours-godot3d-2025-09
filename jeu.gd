extends Node3D

const VITESSE_MAX = 3.5
var orientation: float = 0 

# préférences de contrôle de la caméra :
# ici préférences perso du prof,
# changez à votre convenance
# ou rendez ça paramétrable (exercice bonus !)
var cam_invert_horizontal = 1. # ne pas inverser
var cam_invert_vertical = -1. # inverser

func _ready():
	pass

func _process(delta: float) -> void:
	var personnage = %character
	
	var vitesse = Vector3.ZERO
	var input_lr = Input.get_axis("player_left", "player_right")
	vitesse += Vector3.RIGHT * input_lr
	var input_ud = Input.get_axis("player_down", "player_up")
	vitesse += Vector3.FORWARD * input_ud
	
	var deplacement = VITESSE_MAX * vitesse * delta
	personnage.position = personnage.position + deplacement
	
	## EXO 2
	## BUT DU JEU :
	## 1) le perso doit regarder où il va
	## 2) quand on n'appuie sur rien, le perso doit garder la dernière
	##    direction de regard qu'il avait pendant qu'il se déplaçait.
	if vitesse != Vector3.ZERO:
		orientation = (-Vector3.FORWARD).signed_angle_to(vitesse, Vector3.UP)
	%character.rotation.y = orientation
	
	
	## EXO 3
	## - permettre de déplacer le personnage à la manette
	# solution: voir l'input map dans les paramètres du projet
	
	## EXO BONUS:
	## - permettre de déplacer la caméra à la manette
	##   tout en conservant un déplacement du personnage qui fonctionne 
	# rotation de la caméra dans son repère local,
	# en suivant l'ordre des rotations (paramètre rotation order)
	var cam_input = Vector3(0,1,0) * Input.get_axis("camera_left", "camera_right") \
		+ Vector3(1,0,0) * Input.get_axis("camera_down", "camera_up")
	var cam_rotation_delta = cam_input * delta * Vector3(1,1,1)
	%camera.rotation.x += cam_rotation_delta.x * cam_invert_vertical
	%camera.global_rotation.y += cam_rotation_delta.y * cam_invert_horizontal
