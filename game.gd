extends Node2D

@onready var object = preload("res://object.tscn")
@onready var container = get_node("container")
@onready var label_fps = get_node("Camera2D/CanvasLayer/Control/HBoxContainer/Label_fps")
@onready var label_objects = get_node("Camera2D/CanvasLayer/Control/HBoxContainer/Label_objects")

# Called when the node enters the scene tree for the first time.
func _ready():
	createObject(1000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_objects.text = str(container.get_children().size())
	label_fps.text = str(1.0 / delta)
	
func createObject(_count : int):
	for i in _count:
		var randVector = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
		var randRadius = randf_range(0.0, 150.0)
		var newObject = object.instantiate()
		newObject.global_position = randVector * randRadius
		#newObject.visible = false
		newObject.process_mode = PROCESS_MODE_DISABLED
		container.add_child(newObject)
