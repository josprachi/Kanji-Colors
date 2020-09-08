extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var spin_box = SpinBox.new()
	add_child(spin_box)
	var line_edit = spin_box.get_line_edit()
	line_edit.context_menu_enabled = false
	spin_box.align = LineEdit.ALIGN_RIGHT


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
