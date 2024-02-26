extends Node

func  _unhandled_input(event):
	if Input.is_action_just_pressed("lp"):
		get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
