extends Label

var time = 0
var time_on = false

func _process(delta):
	if (time_on):
		time += delta
	var mil = fmod(time,1)*1000
	var sec = fmod(time, 60)
	var min = fmod(time, 60*60)/60
	var time_p = "%02d : %02d : %02d" % [min, sec, mil]
	text = time_p

func _on_button_pressed():
	show()
	time_on = true

func _on_area_3d_2_body_entered(body):
	time_on = false
