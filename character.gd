extends Node3D

var VITESSE_MAX = 3.5
var orientation: float = 0 

func _process(delta: float) -> void:
	var input_lr = Input.get_axis("player_left", "player_right")
	var input_ud = Input.get_axis("player_down", "player_up")
	var vitesse = Vector3.RIGHT * input_lr + Vector3.FORWARD * input_ud
	
	position += VITESSE_MAX * vitesse * delta	
	if vitesse != Vector3.ZERO:
		orientation = (-Vector3.FORWARD).signed_angle_to(vitesse, Vector3.UP)
	rotation.y = orientation
