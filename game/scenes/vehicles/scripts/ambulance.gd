extends Vehicle

func _ready():
	MAX_ENGINE_FORCE = 250
	STEER_SPEED = 1
	STEER_LIMIT = 0.6

func _physics_process(_delta):
	get_node("ambulance/Siren/Spatial").global_transform = global_transform

func turn_on_siren():
	pass # create a timer for handling siren lights
	
func turn_off_siren():
	pass # create a timer for handling turning off siren
	
func toggle_mini_mission():
	pass # some vehicles has mini missions like gta.
