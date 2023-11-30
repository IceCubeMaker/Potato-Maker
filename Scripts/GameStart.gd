extends Node2D

var custom_level_file_direction = ""
onready var Folder = get_node("FolderPath")

func _ready():
	get_tree().connect("files_dropped", self, "files_dropped");

func files_dropped(files: PoolStringArray, _screen: int):
	custom_level_file_direction = files;
	print("Files: ", custom_level_file_direction)
	Folder.folder_path = files
	Folder.save_info()
