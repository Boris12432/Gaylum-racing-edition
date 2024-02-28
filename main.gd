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
	$"AudioStreamPlayer3D".playing = false
	
	get_tree().change_scene_to_file("res://Menu/control.tscn")
