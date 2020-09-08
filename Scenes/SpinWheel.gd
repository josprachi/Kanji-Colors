extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng 

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	#$Tween.interpolate_method(self, "set_rotation_degrees", 0, 360, 10)
	#$Tween.start()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	


func _on_Tween_tween_completed(object, key):
	#print("tween completed")
	$Tween.stop_all()
	if self.rotation_degrees>360.0:
		self.rotation_degrees-=360.0
	print(self.rotation_degrees)

func _on_Timer_timeout():
	var finalRoation = rng.randf_range(0.0, 360.0)
	if finalRoation<self.rotation_degrees:	
		finalRoation+=self.rotation_degrees
	
	#print(my_random_number)
	$Tween.interpolate_method(self, "set_rotation_degrees", self.rotation_degrees, finalRoation, 10)
	print(self.rotation_degrees)
	$Tween.start()
