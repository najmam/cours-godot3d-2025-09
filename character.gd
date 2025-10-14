extends Node3D

@export var vitesse_max: float = 3.5
@export var nom: String = "toto"
@export var couleur: Color = Color.WHITE

var orientation: float = 0 

func _ready():
	print("rotation du perso au lancement : ", self.rotation * 180./PI)

func _process(delta: float) -> void:
	var input_lr = Input.get_axis("player_left", "player_right")
	var input_ud = Input.get_axis("player_down", "player_up")
	var vitesse = Vector3.RIGHT * input_lr + Vector3.FORWARD * input_ud
	
	position += vitesse_max * vitesse * delta
	if vitesse != Vector3.ZERO:
		orientation = (-Vector3.FORWARD).signed_angle_to(vitesse, Vector3.UP)
	rotation.y = orientation
