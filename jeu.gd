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
	
	%character.rotation_degrees.y = orientation
