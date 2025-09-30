extends Node3D

var VALEUR_VITESSE = 3.5

func _ready():
	print("coucou")

func _process(delta: float) -> void:
	# print("temps écoulé depuis la dernière frame : ", delta)
	var personnage = get_node("character") as Node3D
	
	var vitesse = Vector3(0,0,0)
	
	var should_go_up = Input.is_action_pressed("player_up")
	var should_go_right = Input.is_action_pressed("player_right")
	var should_go_left = Input.is_action_pressed("player_left")
	var should_go_down = Input.is_action_pressed("player_down")
	if should_go_up:
		vitesse += Vector3(0,0,-1)
	if should_go_down:
		vitesse += Vector3(0,0,1)
	if should_go_left:
		vitesse += Vector3(-1,0,0)
	if should_go_right:
		vitesse += Vector3(1,0,0)
	
	var deplacement = VALEUR_VITESSE * vitesse * delta
	personnage.position = personnage.position + deplacement
	
	# Z: avant
	# Q: gauche
	# D: droite
	# S: arrière
