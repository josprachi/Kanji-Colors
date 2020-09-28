extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var coverPos 
var coverFinalPos
var posArray:= [0,1,2,3,4,5,6,7,8,9]
#onready var tween := get_node("Tween")
# Called when the node enters the scene tree for the first time.
func _ready():
	#print($CoverSprite.get_rect().size.y)
	coverPos=$CoverSprite.position
	coverFinalPos=Vector2($CoverSprite.position.x,coverPos.y+($CoverSprite.get_rect().size.y*4))#texture.get_size().y)
	var index=0
	for button in get_tree().get_nodes_in_group("ColorButtons"):
		button.connect("pressed", self, "_which_button_pressed", [button])

func _which_button_pressed(button):
	get_parent().get_node("ColorWheel").checkButtonName(button)	
	#var button_name = button.name
	#print(button_name)
	
func show_Buttons():
	$Tween.interpolate_property($CoverSprite, "position",coverPos, coverFinalPos, 0.5,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_SpinButton_mouse_exited():
	print("button exit")


func _on_SpinButton_button_up():
	print("button clicked")
	

func set_SpinButton_Text():
	var tex=preload("res://Assets/Menu/green_button01.png")
	$SpinButton.texture_normal=tex
	
func _on_SpinButton_pressed():
	
	posArray.shuffle()
	var index=0
	#print(posArray)
	while index<$ButtonRect/ButtonArray.get_child_count():		
		$ButtonRect/ButtonArray.move_child($ButtonRect/ButtonArray.get_children()[index],posArray[index])
		index+=1
	show_Buttons()
	
