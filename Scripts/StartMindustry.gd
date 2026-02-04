extends Button



func _on_pressed() -> void:
	if DataManager.Data.javaPath == '' or DataManager.Data.mindustryPath == '': return
	OS.execute(DataManager.Data.javaPath, ['-jar', DataManager.Data.mindustryPath])
