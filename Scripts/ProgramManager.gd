extends Node



@export var whereJava: Panel

var data: Dictionary = {}

signal first_launch

func _ready() -> void:
	DataManager.initData()
	self.add_child(load('res://UI/Main.tscn').instantiate())
	if (DataManager.Data.firstLaunch): call_deferred('emit_first_launch_signal')

func emit_first_launch_signal() -> void:
	emit_signal('first_launch')

func _on_program_exit() -> void:
	DataManager.dataSave()
