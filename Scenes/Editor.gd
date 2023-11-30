extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var block = preload("res://Scenes/Blocks/Block1.tscn")
var block_positions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var mouse_position = get_global_mouse_position()
	
	var chunk_size = 40;
	var chunk_x = int(mouse_position.x / chunk_size) * chunk_size + chunk_size / 2
	var chunk_y = int(mouse_position.y / chunk_size) * chunk_size + chunk_size / 2
	
	if Input.is_action_pressed("mouse_right"):
		print("mouse_clicked")
		
		if not is_block_at_position(chunk_x, chunk_y):
			var new_block = block.instance()
			add_child(new_block)
			new_block.position.x = chunk_x
			new_block.position.y = chunk_y
			block_positions += [{ 'x' : chunk_x, 'y' : chunk_y}]

func is_block_at_position(x: float, y: float) -> bool:
	for position in block_positions:
		if position.x == x and position.y == y:
			return true
	return false

func _on_Button_pressed(): #saves level to folder
	# Save the level to the folder
	var path = FileBrowser.level_folder

	# Ensure the path is valid
	if not path.empty():
		# Example array (replace this with your actual data)

		# Convert the array to a format that can be easily serialized
		var serialized_data = []

		for position in block_positions:
			serialized_data.append({"x": position.x, "y": position.y})

		# Convert the serialized data to JSON format
		var json_text = JSON.print(serialized_data)

		# Create a File object
		var file = File.new()

		# Open the file for writing
		if file.open(path + "/" + get_node("TextEdit").text + ".lvl", File.WRITE) == OK:
			# Write the JSON data to the file
			file.store_line(json_text)

			# Close the file
			file.close()

			print("JSON file saved successfully.")
		else:
			print("Failed to open the file for writing.", FileBrowser.level_folder)
	else:
		print("Invalid path: ", FileBrowser.level_folder)



