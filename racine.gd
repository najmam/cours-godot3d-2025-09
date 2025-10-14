extends Node3D

const CHARACTER = preload("res://prefabs/character.tscn")

var area_du_personnage

func _ready():
	area_du_personnage = $character/Area3D
	
	# au bout de 1.5 secondes...
	#await get_tree().create_timer(1.5).timeout.connect(func():
		## détruire le noeud "bison"
		#$bison.queue_free())
	# au bout de 2 secondes...
	#await get_tree().create_timer(2).timeout.connect(func():
		## faire apparaître personnage jouable
		#_invoquer_personnage()
	#)
	
	#$coin/Area3D.area_entered.connect(_quand_perso_rencontre_piece)
#q
#func _quand_perso_rencontre_piece(param1):
	#print("coucou je suis le signal area_entered de coin")
	#print(param1 == area_du_personnage)

func _invoquer_personnage():
	var node = CHARACTER.instantiate()
	self.add_child(node) # ajoute le noeud instancié à la scène actuelle

func _process(_delta: float) -> void:
	pass
