extends VehicleBody3D

var dae: int
@export var STEER_SPEED = 1.5
@export var STEER_LIMIT = 0
var steer_target = 0
@export var engine_force_value = 40
var is_master = false

var player_camera: Camera3D = null


		
	

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())
	
func _ready()-> void:
	if is_multiplayer_authority():
		player_camera = $look/Camera3D  # Create a new instance of the camera
		player_camera.make_current()
	

	Setting.grav = gravity_scale
	Setting.mass = mass
	var pp = Setting.mass
	var uu = Setting.grav
	mass = int(pp)
	gravity_scale = int(uu)

func _physics_process(delta):
	if not is_multiplayer_authority(): return
	var speed = linear_velocity.length()*Engine.get_frames_per_second()*delta
	traction(speed)
	$Hud/speed.text=str(round(speed*3.8))+"  KMPH"
	if not is_multiplayer_authority(): return
	

	var fwd_mps = transform.basis.x.x
	
	if not is_multiplayer_authority(): return
	steer_target = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	steer_target += STEER_LIMIT
	if not is_multiplayer_authority(): return
	
	if Input.is_action_pressed("ui_down"):
	# Increase engine force at low speeds to make the initial acceleration faster.

		if speed < 20 and speed != 0:
			engine_force = clamp(engine_force_value * 3 / speed, 0, 150)
		else:
			engine_force = engine_force_value
	else:
		engine_force = 0
	if not is_multiplayer_authority(): return
		
	if Input.is_action_pressed("ui_up"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		if fwd_mps >= -1:
			if speed < 30 and speed != 0:
				engine_force = -clamp(engine_force_value * 13 / speed, 0, 150)
			else:
				engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
		
	if not is_multiplayer_authority(): return
	
	if Input.is_action_pressed("ui_select"):
		brake=3
		$wheal2.wheel_friction_slip=0.8
		$wheal3.wheel_friction_slip=0.8
	else:
		$wheal2.wheel_friction_slip=3
		$wheal3.wheel_friction_slip=3
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)


func traction(speed):
	apply_central_force(Vector3.DOWN*speed)




