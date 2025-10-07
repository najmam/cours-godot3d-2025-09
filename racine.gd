extends Node3D

const VITESSE_MAX = 3.5
var orientation: float = 0

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
		orientation = vitesse.angle_to(Vector3(0,0,1)) * 180/PI
		#orientation = (-Vector3.FORWARD).signed_angle_to(vitesse, Vector3.UP)
	
	# corriger l'orientatiqon quand perso va vers la gauche
	if vitesse.x < 0:
		print("orientation = ", orientation, ", vitesse = ", vitesse)
		orientation = 360-orientation
	
	%character.rotation_degrees.y = orientation
	
	## EXO 3
	## - permettre de déplacer le personnage à la manette
	
	## EXO BONUS:
	## - permettre de déplacer la caméra à la manette
	##   tout en conservant un déplacement du personnage qui fonctionne 
