extends VehicleBody
class_name Vehicle

var STEER_SPEED = 1.5
var STEER_LIMIT = 0.2
var steer_target = 0
export var MAX_ENGINE_FORCE = 300

func enter():
	pass # routines for entering the vehicle.

func exit():
	pass # routines for exiting the vehicle.

func press_horn():
	pass # press the vehicle's horn.

func _physics_process(delta):
	var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	
	steer_target = Input.get_action_strength("move_left_vehicle") - Input.get_action_strength("move_right_vehicle")
	steer_target *= STEER_LIMIT
	
	if Input.is_action_pressed("move_forward_vehicle"):
		var force = MAX_ENGINE_FORCE * Input.get_action_strength("move_forward_vehicle")
		engine_force = -clamp(force, 0, MAX_ENGINE_FORCE)
	else:
		engine_force = 0

	if Input.is_action_pressed("move_back_vehicle"):
		if fwd_mps >= -1:
			var force = MAX_ENGINE_FORCE * Input.get_action_strength("move_back_vehicle")
			engine_force = clamp(force, 0, MAX_ENGINE_FORCE)
		else:
			brake = 1
	else:
		brake = 0.0

	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
