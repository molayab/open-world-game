extends Node
class_name DrivingPlayableState

var fsm: StateMachine
var vehicle_scene: String

func set_params(params):
	if not params is String:
		# None vehicle selected. Using the default one.
		vehicle_scene = "firetruck"
		return 
	vehicle_scene = params

func enter():
	var new_vehicle_scene = load(
		"res://scenes/vehicles/" + vehicle_scene + ".tscn"
	)
			
	var new_vehicle = new_vehicle_scene.instance()
	new_vehicle.name = "Hello World"
	
	var should_clear = false
	for child in get_children():
		if child.name == "Hello World":
			should_clear = true
	
	if should_clear:
		remove_child(new_vehicle)
		
	add_child(new_vehicle)
	get_node("Camera").target = new_vehicle

func _input(event):
	if event is InputEventKey and event.scancode == KEY_K and not event.echo:
		fsm.change_to("DrivingPlayableState", "firetruck")
	elif event is InputEventKey and event.scancode == KEY_L and not event.echo:
		fsm.change_to("DrivingPlayableState", "ambulance")
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
