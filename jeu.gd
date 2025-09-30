extends Node3D

func _ready():
	print("coucou")

func _process(delta: float) -> void:
	# print("temps écoulé depuis la dernière frame : ", delta)
	var personnage = get_node("character") as Node3D
	var deplacement = Vector3(3.2, 0, 0) * delta
	personnage.position = personnage.position + deplacement
