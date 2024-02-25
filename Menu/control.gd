extends Control


var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene
@export var ip = "192.168.1.106"
 

func _on_host_pressed():
	peer.create_server(1832,2)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()

	$"host".queue_free()
	$"join".queue_free()
	$"Start".queue_free()

 	
func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)

func _on_join_pressed(address = ""):
	peer.create_client(ip, 1832)
	multiplayer.multiplayer_peer = peer
	$"host".queue_free()
	$"join".queue_free()
	$"Start".queue_free()
	


func _on_start_pressed():
	_add_player()
	$"host".queue_free()
	$"join".queue_free()
	$"Start".queue_free()
