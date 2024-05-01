extends Control


var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene
@export var ip = "192.168.1.106"


func _on_host_pressed():
	peer.create_server(1832,2)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	$"host".queue_free()
	$"join".queue_free()
	$"Start".queue_free()
	_add_scene()
	_add_player()
	

func _add_scene():
	var add_scene = load("res://main.tscn").instantiate()
	get_tree().root.add_child(add_scene)
	

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)

func _on_join_pressed(address = ""):
	peer.create_client(ip, 1832)
	multiplayer.multiplayer_peer = peer
	_add_scene()
	$"host".queue_free()
	$"join".queue_free()
	$"Start".queue_free()
	


func _on_start_pressed():
	$"host".queue_free()
	$"join".queue_free()
	$"Start".queue_free()
	_add_scene()
	_add_player()



func _on_exit_pressed():
	get_tree().quit()
