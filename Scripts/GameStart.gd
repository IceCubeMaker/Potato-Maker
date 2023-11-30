extends Node2D

var custom_level_file_direction = ""
onready var Folder = get_node("FolderPath")

func _ready():
	get_tree().connect("files_dropped", self, "files_dropped");

func files_dropped(files: PoolStringArray, _screen: int):
	custom_level_file_direction = files;
	print("Files: ", custom_level_file_direction)
	Folder.folder_path = files
	FileBrowser.level_folder = remove_square_brackets(str(files));
	Folder.save_info()


func _on_Button_pressed():
	switch_scene("res://Scenes/Editor.tscn")

# Function to switch scenes
func switch_scene(scene) -> void:
	# Change the scene
	get_tree().change_scene(scene)

func remove_square_brackets(input_string: String) -> String:
	return input_string.replace("[", "").replace("]", "")


func _on_LoadLevel_pressed():
	switch_scene("res://Scenes/load_level.tscn");
