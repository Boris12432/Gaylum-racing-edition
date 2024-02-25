extends Node3D



func _unhandled_input(event):
	if Input.is_action_pressed("esc"):
		$"Menuo".show()
	if Input.is_action_pressed("altb"):
		$"Control2".show()
