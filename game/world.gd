extends WorldEnvironment

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_vehicle(vehicle_class):
	var heldobject = load("res://scenes/vehicles/" + vehicle_class + ".tscn").instance()
	heldobject.global_transform.origin = get_viewport().get_camera().global_transform.origin
	
	# Fire it
	var speed = 7.5
	var basis = heldobject.get_transform().basis
	var z = Vector3(basis.x.z, basis.y.z, -basis.z.z)
	heldobject.set_linear_velocity(z * speed)
	add_child(heldobject)

func spawn_ped():
	pass

var available_vehicles_to_shaffle_spawn = [
	"ambulance",
	"truck",
	"firetruck",
	"taxi"
]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("spawn_ambulance"):
		var size = available_vehicles_to_shaffle_spawn.size()
		var rand = RandomNumberGenerator.new()
		rand.randomize()
		
		spawn_vehicle(available_vehicles_to_shaffle_spawn[
			rand.randi_range(0, size - 1)
		])
