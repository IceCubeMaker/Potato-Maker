extends Node

var save_filename = "user://custom_level_folder_path.save"
var folder_path = ""

func save_info():
	var save_file = File.new();
	save_file.open(save_filename, File.WRITE)
	var info = {
		'custom_levels_path' : folder_path,
	}
	save_file.store_line(to_json(info))
	print("game saved");
	save_file.close();

func _ready():
	var save_file = File.new()
	
	if save_file.file_exists(save_filename):
		save_file.open(save_filename, File.READ)
		var saved_data = parse_json(save_file.get_as_text())
		save_file.close()
		if saved_data:
			# Access saved information
			var custom_levels_path = saved_data['custom_levels_path']
			FileBrowser.level_folder = remove_square_brackets(str(saved_data['custom_levels_path']));
			# Use the loaded information as needed
			# For example, you can print it
			print("Loaded custom_levels_path:", custom_levels_path)
		else:
			print("Error parsing JSON data")
	else:
		print("Save file not found")
		
func remove_square_brackets(input_string: String) -> String:
	return input_string.replace("[", "").replace("]", "")
