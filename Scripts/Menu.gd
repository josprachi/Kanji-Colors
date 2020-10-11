extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var coverPos 
var coverFinalPos
var posArray:= [0,1,2,3,4,5,6,7,8,9]

# Called when the node enters the scene tree for the first time.
func _ready():	
	coverPos=$CoverSprite.position
	$WindowDialog.popup()
	coverFinalPos=Vector2($CoverSprite.position.x,coverPos.y+($CoverSprite.get_rect().size.y*4))#texture.get_size().y)
	var index=0
	for button in get_tree().get_nodes_in_group("ColorButtons"):
		button.connect("pressed", self, "_which_button_pressed", [button])
		button.disabled = true

func _which_button_pressed(button):
	#call check button name method from color wheel class
	get_parent().get_node("ColorWheel").checkButtonName(button)
	disableColorButtons(true)
	$ButtonRect/ButtonArray.visible=false
	
	
func show_Buttons():
	$Tween.interpolate_property($CoverSprite, "position",coverPos, coverFinalPos, 0.5,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
func set_SpinButton_Text():
	var tex=preload("res://Assets/Menu/green_button01.png")
	$SpinButton.texture_normal=tex
	
func disableColorButtons(val):
	for button in get_tree().get_nodes_in_group("ColorButtons"):
		button.disabled = val
	
func _on_SpinButton_pressed():	
	posArray.shuffle()
	var index=0
	get_parent().get_node("ColorWheel").canSpin=true
	$ButtonRect/ButtonArray.visible=true
	disableColorButtons(false)
	while index<$ButtonRect/ButtonArray.get_child_count():
		$ButtonRect/ButtonArray.move_child($ButtonRect/ButtonArray.get_children()[index],posArray[index])		
		index+=1
	show_Buttons()
	$SpinButton.disabled = true
	
