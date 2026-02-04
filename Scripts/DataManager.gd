class_name DataManager


static var filePath: String = 'res://Data.json'

class Data:
	static var firstLaunch: bool = true
	static var javaPath: String = ''
	static var mindustryPath: String = ''

static func initData() -> void:
	var file: FileAccess = FileAccess.open(filePath, FileAccess.READ)
	var jsonContent: String = file.get_as_text()
	file.close()
	
	var data: Variant = JSON.parse_string(jsonContent)
	Data.firstLaunch = data.get('firstLaunch') if data.get('firstLaunch') != null else true
	Data.javaPath = data.get('javaPath') if data.get('javaPath') != null else ''
	Data.mindustryPath = data.get('mindustryPath') if data.get('mindustryPath') != null else ''

static func dataSave() -> void:
	var saveData: Dictionary = {
		"firstLaunch": DataManager.Data.firstLaunch,
		"javaPath": DataManager.Data.javaPath,
		"mindustryPath": DataManager.Data.mindustryPath
	}
	var file: FileAccess = FileAccess.open(filePath, FileAccess.WRITE)
	var jsonContent: String = JSON.stringify(saveData)
	file.store_string(jsonContent)
	file.close()


'''
# JSON数据管理脚本
# 用于存储和加载游戏配置、用户设置等数据

var data = {}
var file_path = "user://game_data.json"

# 初始化函数
func _ready() -> void:
	load_data()

# 加载JSON数据
func load_data() -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var json_content = file.get_as_text()
		file.close()
		data = JSON.parse_string(json_content)
		print("数据加载成功:", data)
	else:
		print("首次运行，创建默认数据")
		# 创建默认数据
		data = {
			"game_path": "/Users/qwertyuiop/Mindustry/Game/Mindustry.jar",
			"last_played": "",
			"settings": {
				"show_popup": true,
				"auto_start": false
			}
		}
		save_data()

# 保存JSON数据
func save_data() -> void:
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		var json_content = JSON.stringify(data, "  ")
		file.store_string(json_content)
		file.close()
		print("数据保存成功")
	else:
		print("无法保存数据")

# 获取数据
func get_data(key: String = "") -> Variant:
	if key == "":
		return data
	else:
		return data.get(key, null)

# 设置数据
func set_data(key: String, value: Variant) -> void:
	data[key] = value
	save_data()

# 更新嵌套数据
func update_nested_data(path: Array, value: Variant) -> void:
	var current = data
	for i in range(path.size() - 1):
		var key = path[i]
		if not current.has(key):
			current[key] = {}
		current = current[key]
	current[path.back()] = value
	save_data()

# 获取嵌套数据
func get_nested_data(path: Array) -> Variant:
	var current = data
	for key in path:
		if not current.has(key):
			return null
		current = current[key]
	return current
'''
