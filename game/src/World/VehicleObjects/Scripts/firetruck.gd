extends Vehicle

func _ready():
	MAX_ENGINE_FORCE = 280
	STEER_SPEED = 0.6
	STEER_LIMIT = 0.65

func _physics_process(_delta):
	$Firetruck/Siren/Spatial.global_transform = global_transform

func turn_on_siren():
	pass # create a timer for handling siren lights
	
func turn_off_siren():
	pass # create a timer for handling turning off siren
	
func toggle_mini_mission():
	pass # some vehicles has mini missions like gta.
