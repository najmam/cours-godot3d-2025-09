extends Area3D

func _ready():
	var area = self
	area.area_entered.connect(_quand_piece_chevauchee)

func _quand_piece_chevauchee(param1):
	print("piece atteinte")
	%sound_effect_coin.play()
	self.queue_free() # faire disparaitre la piece
