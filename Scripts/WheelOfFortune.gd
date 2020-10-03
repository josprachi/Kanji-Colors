extends RigidBody2D


# Declare member variables here. Examples:

var rng
var petalColor
var canSpin = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
func _physics_process(delta):
	if (canSpin == true ) :
		self.angular_velocity=rng.randf_range(40.0, 150.0)
		canSpin=false

#func _on_Timer_timeout():
	#if (canSpin == true and self.angular_velocity==0.0) :
		#self.angular_velocity=rng.randf_range(40.0, 150.0) #pass # Replace with function body.

func checkButtonName(button):
	#match the color of petal with name of button color and display sprite on the button in the corner and display color too
	get_parent().get_node("Color_NameSprite").texture = button.icon
	get_parent().get_node("Color_NameSprite").visible=true
	print(button.name)
	

func _on_WheelPin_body_entered(body):	
	if self.angular_velocity<1 :		
		if(body.get_name().begins_with ("Petal")):
			print(body.PetalColorName)
			petalColor = body.PetalColorName
			
			get_parent().get_node("Color_Sprite").modulate = body.modulate
			self.angular_velocity = 0.0
