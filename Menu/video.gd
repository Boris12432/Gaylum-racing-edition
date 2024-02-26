extends Control


func _process(delta):
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN
	


func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://Menu/control.tscn")

func _unhandled_input(event):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Menu/control.tscn")
		$"VideoStreamPlayer".paused = true
