extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng
var petalColor 

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()


func _on_Timer_timeout():
	if ( self.angular_velocity==0.0) :
		self.angular_velocity=rng.randf_range(40.0, 150.0) #pass # Replace with function body.

func checkButtonName(button):
	print("here1")
	print(button.name)
	print("here2")

func _on_WheelPin_body_entered(body):
	#print(self.angular_velocity)
	if self.angular_velocity<1 :		
		if(body.get_name().begins_with ("Petal")):
			print(body.PetalColorName)
			self.angular_velocity=0.0
