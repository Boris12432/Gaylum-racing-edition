extends Control

func _process(delta):
	var ii = Setting.mass
	var oo = Setting.grav
	$"Panel".text = str(ii)
	$"Panel2".text = str(oo)
	Setting.mass = $"LineEdit".text
	Setting.grav = $"LineEdit2".text
