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
	var vehicle_placeholder = get_node("Placeholder")
	
	# Remove old one.
	var parent = vehicle_placeholder.get_parent()
	parent.remove_child(vehicle_placeholder)
	vehicle_placeholder.call_deferred("free")
	
	# Let's make the change.
	new_vehicle.name = vehicle_placeholder.name
	parent.add_child(new_vehicle)
	vehicle_placeholder = new_vehicle
	get_node("Camera").set_target(vehicle_placeholder)

func _input(event):
	if event is InputEventKey and event.scancode == KEY_K and not event.echo:
		fsm.change_to("DrivingPlayableState", "firetruck")
	elif event is InputEventKey and event.scancode == KEY_L and not event.echo:
		fsm.change_to("DrivingPlayableState", "ambulance")
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
