extends Node



@export var whereJava: Panel
@export var whereMindutry: Panel
@export var fileDialog_Java: FileDialog
@export var fileDialog_Mindustry: FileDialog

func _ready() -> void:
	var programManager = get_parent().get_parent()
	if programManager and programManager.has_method('connect'):
		programManager.connect('first_launch', Callable(self, '_on_first_launch'))
	fileDialog_Java.current_path = '/Library/Java/JavaVirtualMachines'
	fileDialog_Mindustry.current_path = 'user://'

func _on_first_launch() -> void:
	whereJava.visible = true

func _on_get_java_path_pressed() -> void:
	fileDialog_Java.popup_centered()

func _on_file_dialog_java_file_selected(path: String) -> void:
	whereJava.visible = false
	whereMindutry.visible = true
	DataManager.Data.javaPath = path

func _on_get_mindustry_path_pressed() -> void:
	fileDialog_Mindustry.popup_centered()

func _on_file_dialog_mindustry_file_selected(path: String) -> void:
	whereMindutry.visible = false
	DataManager.Data.mindustryPath = path
