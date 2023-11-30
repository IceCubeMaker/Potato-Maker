extends Node2D

func _ready():
	get_tree().connect("files_dropped", self, "files_dropped");

