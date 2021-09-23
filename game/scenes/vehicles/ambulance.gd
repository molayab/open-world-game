extends VehicleBody

const STEER_SPEED = 1
const STEER_LIMIT = 0.6
var steer_target = 0
export var engine_force_value = 400

func _physics_process(delta):
	var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	
	# global_transform = node.global_transform
	get_node("ambulance/Siren/Spatial").global_transform = global_transform
	
	steer_target = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	steer_target *= STEER_LIMIT
	
	if Input.is_action_pressed("move_back"):
		engine_force = engine_force_value
	else:
		engine_force = 0
	
	if Input.is_action_pressed("move_forward"):
		if (fwd_mps >= -1):
			engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
	
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
