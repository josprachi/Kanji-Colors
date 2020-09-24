extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#print(self.angular_velocity)	#if floor(self.angular_velocity)<=0 :		#print(self.angular_velocity)
	
	


func _on_Timer_timeout():
	if ( self.angular_velocity==0.000000) :
		self.angular_velocity=100.0 #pass # Replace with function body.



func _on_WheelPin_body_entered(body):
	#print(self.angular_velocity)
	if self.angular_velocity<=0.2 :
		#print("XXX")
		if(body.get_name().begins_with ("Petal")):
			print(body.PetalColorName)
