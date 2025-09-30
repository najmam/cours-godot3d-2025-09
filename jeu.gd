extends Node3D

var VALEUR_VITESSE = 3.5

func _ready():
	print("coucou")

func _process(delta: float) -> void:
	# print("temps écoulé depuis la dernière frame : ", delta)	
	var personnage = %character
	
	var vitesse = Vector3(0,0,0)
	var input_lr = Input.get_axis("player_left", "player_right")
	vitesse += Vector3(1,0,0) * input_lr
	var input_ud = Input.get_axis("player_up", "player_down")
	vitesse += Vector3(0,0,1) * input_ud
	
	var deplacement = VALEUR_VITESSE * vitesse * delta
	personnage.position = personnage.position + deplacement
	
	var orientation = 0
	## EXO 2
	## BUT DU JEU :
	## 1) le perso doit regarder où il va
	## 2) quand on n'appuie sur rien, le perso doit garder la dernière
	##    direction de regard qu'il avait pendant qu'il se déplaçait.
	var machin = vitesse.angle_to(Vector3(0,0,1)) * 180/PI
	print("vitesse = ", vitesse, ", machin = ", machin)
	orientation = machin
	%character.rotation_degrees.y = orientation
	
	## EXO 3
	## - permettre de déplacer le personnage à la manette
	
	## EXO BONUS:
	## - permettre de déplacer la caméra à la manette
	##   tout en conservant un déplacement du personnage qui fonctionne 
