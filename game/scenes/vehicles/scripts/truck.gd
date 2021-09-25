extends Vehicle

func _ready():
	MAX_ENGINE_FORCE = 180
	STEER_SPEED = 0.8
	STEER_LIMIT = 0.5

func _physics_process(_delta):
	pass

func turn_on_siren():
	pass # create a timer for handling siren lights
	
func turn_off_siren():
	pass # create a timer for handling turning off siren
	
func toggle_mini_mission():
	pass # some vehicles has mini missions like gta.
