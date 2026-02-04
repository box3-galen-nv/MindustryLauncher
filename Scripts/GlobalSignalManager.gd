class_name GlobalSignalManager

# 全局信号管理器
# 用于管理跨脚本的信号通信

# 定义全局信号
signal first_launch

# 单例实例
static var instance: GlobalSignalManager

# 获取单例实例
static func get_instance() -> GlobalSignalManager:
	if instance == null:
		instance = GlobalSignalManager.new()
	return instance

# 发出首次启动信号
static func emit_first_launch():
	get_instance().emit_signal("first_launch")

# 连接首次启动信号
static func connect_first_launch(callable: Callable):
	get_instance().connect("first_launch", callable)
