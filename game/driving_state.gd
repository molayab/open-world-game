extends Node
class_name DrivingPlayableState

var fsm: StateMachine
var vehicle_scene: String
var new_vehicle: Spatial

func set_params(params):
	if not params is String:
		# None vehicle selected. Using the default one.
		vehicle_scene = "truck"
		return 
	vehicle_scene = params

func enter():
	var new_vehicle_scene = load(
		"res://scenes/vehicles/" + vehicle_scene + ".tscn"
	)
	
	if new_vehicle:
		remove_child(new_vehicle)
			
	new_vehicle = new_vehicle_scene.instance()
	add_child(new_vehicle)
	get_node("Camera").target = new_vehicle
	
	new_vehicle.is_controlling = true

func _input(event):
	pass
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
