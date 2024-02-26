extends Node3D

func _unhandled_input(event):
	if Input.is_action_pressed("esc"):
		$"Menuo".show()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) || Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		$"Menuo".hide()
	if Input.is_action_pressed("altb"):
		$"Control2".show()
func _ready():
	$"Control/host".queue_free()
	$"Control/join".queue_free()
	$"Control/Start".queue_free()
	
