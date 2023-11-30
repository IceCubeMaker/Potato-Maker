extends Button


# Function to switch scenes
func switch_scene(target_scene_path: String) -> void:
	# Get the current SceneTree
	var scene_tree = get_tree()

	# Load the new scene
	var new_scene = preload(target_scene_path)

	# Change the scene
	scene_tree.change_scene(new_scene)
