extends Node3D
func _unhandled_input(event):
	if Input.is_action_pressed("esc"):
		$"Menuo".show()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) || Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		$"Menuo".hide()
	if Input.is_action_pressed("altb"):
		$"Control2".show()
func _ready():
	$"Control3/host".queue_free()
	$"Control3/join".queue_free()
	$"Control3/Start".queue_free()
	


func _on_back_2_pressed():
	$"Menuo".hide()
	
	
	get_tree().change_scene_to_file("res://Menu/control.tscn")

func _on_area_3d_body_entered(body):
	$CSGBox3D/Label.show()

func _on_area_3d_body_exited(body):
	$CSGBox3D/Label.hide()


func _on_button_pressed():
	$CSGBox3D/Label.hide()
