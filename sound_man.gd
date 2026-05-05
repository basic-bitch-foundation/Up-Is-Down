extends Node

var snd_jump = preload("res://jump.wav")
var snd_coin = preload("res://cookie.ogg")
var snd_game_over = preload("res://over.wav")
var snd_button = preload("res://click.wav")

var players: Array[AudioStreamPlayer] = []

func _ready():
	for i in 8:
		var p = AudioStreamPlayer.new()
		add_child(p)
		players.append(p)

func _free_player() -> AudioStreamPlayer:
	for p in players:
		if not p.playing:
			return p
	return players[0]

func _play(stream: AudioStream):
	var p = _free_player()
	p.stream = stream
	p.play()

func play_jump():    _play(snd_jump)
func play_coin():    _play(snd_coin)
func play_game_over():    _play(snd_game_over)
func play_click():   _play(snd_button)
